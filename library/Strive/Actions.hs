{-# LANGUAGE OverloadedStrings #-}

-- | Functions for performing actions against the API.
module Strive.Actions
    ( getActivity
    , getAthlete
    , getAthleteCRs
    , getComments
    , getCommonFriends
    , getCurrentActivities
    , getCurrentAthlete
    , getCurrentFollowers
    , getCurrentFriends
    , getEffort
    , getEfforts
    , getFollowers
    , getFriends
    , getFriendsActivities
    , getKudoers
    , getLaps
    , getLeaders
    , getPhotos
    , getSegment
    , getSegments
    , getStarredSegments
    , getZones
    , module Actions
    ) where

import           Data.Aeson              (decode, encode, (.:))
import           Data.Aeson.Types        (parseEither)
import           Data.ByteString.Char8   (pack)
import           Data.ByteString.Lazy    (toStrict)
import           Data.List               (intercalate)
import           Data.Monoid             ((<>))
import           Data.Time.Clock         (UTCTime)
import           Data.Time.Clock.POSIX   (utcTimeToPOSIXSeconds)
import           Network.HTTP.Conduit    (responseBody)
import           Strive.Actions.Clubs    as Actions
import           Strive.Actions.Gear     as Actions
import           Strive.Actions.Internal (buildRequest, get, makeRequest,
                                          paginate)
import           Strive.Client           (Client)
import qualified Strive.Objects          as Objects
import qualified Strive.Types            as Types

-- | <http://strava.github.io/api/v3/activities/#get-details>
getActivity :: Client -> Types.ActivityId -> Maybe Bool -> IO (Either String Objects.ActivitySummary)
getActivity client activityId allEfforts = get client resource query
  where
    resource = "activities/" <> show activityId
    query = case allEfforts of
        Just flag -> [("include_all_efforts", toStrict (encode flag))]
        _ -> []

-- | <http://strava.github.io/api/v3/athlete/#get-another-details>
getAthlete :: Client -> Types.AthleteId -> IO (Either String Objects.AthleteSummary)
getAthlete client athleteId = get client resource query
  where
    resource = "athletes/" <> show athleteId
    query = []

-- | <http://strava.github.io/api/v3/athlete/#koms>
getAthleteCRs :: Client -> Types.AthleteId -> Types.Page -> Types.PerPage -> IO (Either String [Objects.EffortSummary])
getAthleteCRs client athleteId page perPage = get client resource query
  where
    resource = "athletes/" <> show athleteId <> "/koms"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/comments/#list>
getComments :: Client -> Types.ActivityId -> Types.IncludeMarkdown -> Types.Page -> Types.PerPage -> IO (Either String [Objects.CommentSummary])
getComments client activityId includeMarkdown page perPage = get client resource query
  where
    resource = "activities/" <> show activityId <> "/comments"
    query = ("markdown", toStrict (encode includeMarkdown)) : paginate page perPage

-- | <http://strava.github.io/api/v3/follow/#both>
getCommonFriends :: Client -> Types.AthleteId -> Types.Page -> Types.PerPage -> IO (Either String [Objects.AthleteSummary])
getCommonFriends client athleteId page perPage = get client resource query
  where
    resource = "athletes/" <> show athleteId <> "/both-following"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/activities/#get-activities>
getCurrentActivities :: Client -> Maybe UTCTime -> Maybe UTCTime -> Types.Page -> Types.PerPage -> IO (Either String [Objects.ActivitySummary])
getCurrentActivities client before after page perPage = get client resource query
  where
    resource = "athlete/activities"
    query = paginate page perPage <> go
        [ ("before", fmap (pack . show . utcTimeToPOSIXSeconds) before)
        , ("after", fmap (pack . show . utcTimeToPOSIXSeconds) after)
        ]
    go [] = []
    go ((_, Nothing) : xs) = go xs
    go ((k, Just v) : xs) = (k, v) : go xs

-- | <http://strava.github.io/api/v3/athlete/#get-details>
getCurrentAthlete :: Client -> IO (Either String Objects.AthleteDetailed)
getCurrentAthlete client = get client resource query
  where
    resource = "athlete"
    query = []

-- | <http://strava.github.io/api/v3/follow/#followers>
getCurrentFollowers :: Client -> Types.Page -> Types.PerPage -> IO (Either String [Objects.AthleteSummary])
getCurrentFollowers client page perPage = get client resource query
  where
    resource = "athlete/followers"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/follow/#friends>
getCurrentFriends :: Client -> Types.Page -> Types.PerPage -> IO (Either String [Objects.AthleteSummary])
getCurrentFriends client page perPage = get client resource query
  where
    resource = "athlete/friends"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/efforts/#retrieve>
getEffort :: Client -> Types.EffortId -> IO (Either String Objects.EffortSummary)
getEffort client effortId = get client resource query
  where
    resource = "segment_efforts/" <> show effortId
    query = []

-- | <http://strava.github.io/api/v3/segments/#efforts>
getEfforts :: Client -> Types.SegmentId -> Maybe (UTCTime, UTCTime) -> Types.Page -> Types.PerPage -> IO (Either String [Objects.EffortSummary])
getEfforts client segmentId maybeTimes page perPage = get client resource query
  where
    resource = "segments/" <> show segmentId <> "/all_efforts"
    query = case maybeTimes of
        Just (startTime, endTime) ->
            ("start_date_local", toStrict (encode startTime)) :
            ("end_date_local", toStrict (encode endTime)) :
            pagination
        _ -> pagination
    pagination = paginate page perPage

-- | <http://strava.github.io/api/v3/follow/#followers>
getFollowers :: Client -> Types.AthleteId -> Types.Page -> Types.PerPage -> IO (Either String [Objects.AthleteSummary])
getFollowers client athleteId page perPage = get client resource query
  where
    resource = "athletes/" <> show athleteId <> "/followers"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/follow/#friends>
getFriends :: Client -> Types.AthleteId -> Types.Page -> Types.PerPage -> IO (Either String [Objects.AthleteSummary])
getFriends client athleteId page perPage = get client resource query
  where
    resource = "athletes/" <> show athleteId <> "/friends"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/activities/#get-feed>
getFriendsActivities :: Client -> Types.Page -> Types.PerPage -> IO (Either String [Objects.ActivitySummary])
getFriendsActivities client page perPage = get client resource query
  where
    resource = "activities/following"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/activities/#laps>
getLaps :: Client -> Types.ActivityId -> IO (Either String [Objects.EffortLap])
getLaps client activityId = get client resource query
  where
    resource = "activities/" <> show activityId <> "/laps"
    query = []

-- | <http://strava.github.io/api/v3/kudos/#list>
getKudoers :: Client -> Types.ActivityId -> Types.Page -> Types.PerPage -> IO (Either String [Objects.AthleteSummary])
getKudoers client activityId page perPage = get client resource query
  where
    resource = "activities/" <> show activityId <> "/kudos"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/segments/#leaderboard>
getLeaders :: Client -> Types.SegmentId -> Maybe Char -> Maybe String -> Maybe String -> Maybe Bool -> Maybe Integer -> Maybe String -> Types.Page -> Types.PerPage -> IO (Either String [Objects.SegmentLeader])
getLeaders client segmentId gender ageGroup weightClass following clubId dateRange page perPage = do
    request <- buildRequest client resource query
    response <- makeRequest client request
    let body = responseBody response
        object = decode body
        leaders = case object of
            Nothing -> Left ""
            Just o -> parseEither (.: "entries") o
    return leaders
  where
    resource = "segments/" <> show segmentId <> "/leaderboard"
    query = paginate page perPage <> go
        [ ("gender", fmap (pack . show) gender)
        , ("age_group", fmap pack ageGroup)
        , ("weight_class", fmap pack weightClass)
        , ("following", fmap (toStrict . encode) following)
        , ("club_id", fmap (pack . show) clubId)
        , ("date_range", fmap pack dateRange)
        ]
    go [] = []
    go ((_, Nothing) : xs) = go xs
    go ((k, Just v) : xs) = (k, v) : go xs

-- | <http://strava.github.io/api/v3/photos/#list>
getPhotos :: Client -> Types.ActivityId -> IO (Either String [Objects.PhotoSummary])
getPhotos client activityId = get client resource query
  where
    resource = "activities/" <> show activityId <> "/photos"
    query = []

-- | <http://strava.github.io/api/v3/segments/#retrieve>
getSegment :: Client -> Types.SegmentId -> IO (Either String Objects.SegmentDetailed)
getSegment client segmentId = get client resource query
  where
    resource = "segments/" <> show segmentId
    query = []

-- | <http://strava.github.io/api/v3/segments/#explore>
getSegments :: Client -> (Double, Double, Double, Double) -> Maybe String -> Maybe Integer -> Maybe Integer -> IO (Either String [Objects.SegmentExploration])
getSegments client (south, west, north, east) activityType minCat maxCat = do
    request <- buildRequest client resource query
    response <- makeRequest client request
    let body = responseBody response
        object = decode body
        segments = case object of
            Nothing -> Left ""
            Just o -> parseEither (.: "segments") o
    return segments
  where
    resource = "segments/explore"
    query = go
        [ ("bounds", Just (pack bounds))
        , ("activity_type", fmap pack activityType)
        , ("min_cat", fmap (pack . show) minCat)
        , ("max_cat", fmap (pack . show) maxCat)
        ]
    bounds = intercalate "," (fmap show [south, west, north, east])
    go [] = []
    go ((_, Nothing) : xs) = go xs
    go ((k, Just v) : xs) = (k, v) : go xs

-- | <http://strava.github.io/api/v3/segments/#starred>
getStarredSegments :: Client -> Types.Page -> Types.PerPage -> IO (Either String [Objects.SegmentSummary])
getStarredSegments client page perPage = get client resource query
  where
    resource = "segments/starred"
    query = paginate page perPage

-- | <http://strava.github.io/api/v3/activities/#zones>
getZones :: Client -> Types.ActivityId -> IO (Either String [Objects.ZoneSummary])
getZones client activityId = get client resource query
  where
    resource = "activities/" <> show activityId <> "/zones"
    query = []