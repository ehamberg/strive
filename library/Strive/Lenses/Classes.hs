{-# LANGUAGE FunctionalDependencies #-}

module Strive.Lenses.Classes where

import Strive.Lenses (Lens)

class AccessTokenLens a b | a -> b where
  accessToken :: Lens a b

class AchievementCountLens a b | a -> b where
  achievementCount :: Lens a b

class ActivityIdLens a b | a -> b where
  activityId :: Lens a b

class ActivityTypeLens a b | a -> b where
  activityType :: Lens a b

class AfterLens a b | a -> b where
  after :: Lens a b

class AgeGroupLens a b | a -> b where
  ageGroup :: Lens a b

class AllEffortsLens a b | a -> b where
  allEfforts :: Lens a b

class ApprovalPromptLens a b | a -> b where
  approvalPrompt :: Lens a b

class AthleteCountLens a b | a -> b where
  athleteCount :: Lens a b

class AthleteGenderLens a b | a -> b where
  athleteGender :: Lens a b

class AthleteIdLens a b | a -> b where
  athleteId :: Lens a b

class AthleteLens a b | a -> b where
  athlete :: Lens a b

class AthleteNameLens a b | a -> b where
  athleteName :: Lens a b

class AthleteProfileLens a b | a -> b where
  athleteProfile :: Lens a b

class AverageCadenceLens a b | a -> b where
  averageCadence :: Lens a b

class AverageGradeLens a b | a -> b where
  averageGrade :: Lens a b

class AverageHeartrateLens a b | a -> b where
  averageHeartrate :: Lens a b

class AverageHrLens a b | a -> b where
  averageHr :: Lens a b

class AverageSpeedLens a b | a -> b where
  averageSpeed :: Lens a b

class AverageWattsLens a b | a -> b where
  averageWatts :: Lens a b

class AvgGradeLens a b | a -> b where
  avgGrade :: Lens a b

class BeforeLens a b | a -> b where
  before :: Lens a b

class BikesLens a b | a -> b where
  bikes :: Lens a b

class BrandNameLens a b | a -> b where
  brandName :: Lens a b

class CaloriesLens a b | a -> b where
  calories :: Lens a b

class CaptionLens a b | a -> b where
  caption :: Lens a b

class CityLens a b | a -> b where
  city :: Lens a b

class ClimbCategoryDescLens a b | a -> b where
  climbCategoryDesc :: Lens a b

class ClimbCategoryLens a b | a -> b where
  climbCategory :: Lens a b

class ClubIdLens a b | a -> b where
  clubId :: Lens a b

class ClubTypeLens a b | a -> b where
  clubType :: Lens a b

class ClubsLens a b | a -> b where
  clubs :: Lens a b

class CommentCountLens a b | a -> b where
  commentCount :: Lens a b

class CommuteLens a b | a -> b where
  commute :: Lens a b

class CountryLens a b | a -> b where
  country :: Lens a b

class CreatedAtLens a b | a -> b where
  createdAt :: Lens a b

class DataLens a b | a -> b where
  data_ :: Lens a b

class DatePreferenceLens a b | a -> b where
  datePreference :: Lens a b

class DateRangeLens a b | a -> b where
  dateRange :: Lens a b

class DescriptionLens a b | a -> b where
  description :: Lens a b

class DistanceLens a b | a -> b where
  distance :: Lens a b

class DistributionBucketsLens a b | a -> b where
  distributionBuckets :: Lens a b

class EffortCountLens a b | a -> b where
  effortCount :: Lens a b

class EffortIdLens a b | a -> b where
  effortId :: Lens a b

class ElapsedTimeLens a b | a -> b where
  elapsedTime :: Lens a b

class ElevDifferenceLens a b | a -> b where
  elevDifference :: Lens a b

class ElevationHighLens a b | a -> b where
  elevationHigh :: Lens a b

class ElevationLowLens a b | a -> b where
  elevationLow :: Lens a b

class EmailLens a b | a -> b where
  email :: Lens a b

class EndIndexLens a b | a -> b where
  endIndex :: Lens a b

class EndLatitudeLens a b | a -> b where
  endLatitude :: Lens a b

class EndLatlngLens a b | a -> b where
  endLatlng :: Lens a b

class EndLongitudeLens a b | a -> b where
  endLongitude :: Lens a b

class EntriesLens a b | a -> b where
  entries :: Lens a b

class EntryCountLens a b | a -> b where
  entryCount :: Lens a b

class ErrorLens a b | a -> b where
  error_ :: Lens a b

class ExternalIdLens a b | a -> b where
  externalId :: Lens a b

class FirstnameLens a b | a -> b where
  firstname :: Lens a b

class FlaggedLens a b | a -> b where
  flagged :: Lens a b

class FollowerCountLens a b | a -> b where
  followerCount :: Lens a b

class FollowerLens a b | a -> b where
  follower :: Lens a b

class FollowingLens a b | a -> b where
  following :: Lens a b

class FrameTypeLens a b | a -> b where
  frameType :: Lens a b

class FriendCountLens a b | a -> b where
  friendCount :: Lens a b

class FriendLens a b | a -> b where
  friend :: Lens a b

class FtpLens a b | a -> b where
  ftp :: Lens a b

class GearIdLens a b | a -> b where
  gearId :: Lens a b

class GearLens a b | a -> b where
  gear :: Lens a b

class GenderLens a b | a -> b where
  gender :: Lens a b

class HasKudoedLens a b | a -> b where
  hasKudoed :: Lens a b

class HazardousLens a b | a -> b where
  hazardous :: Lens a b

class HiddenLens a b | a -> b where
  hidden :: Lens a b

class HttpManagerLens a b | a -> b where
  httpManager :: Lens a b

class IdLens a b | a -> b where
  id_ :: Lens a b

class InstagramPrimaryPhotoLens a b | a -> b where
  instagramPrimaryPhoto :: Lens a b

class KilojoulesLens a b | a -> b where
  kilojoules :: Lens a b

class KomRankLens a b | a -> b where
  komRank :: Lens a b

class KudosCountLens a b | a -> b where
  kudosCount :: Lens a b

class LapIndexLens a b | a -> b where
  lapIndex :: Lens a b

class LastnameLens a b | a -> b where
  lastname :: Lens a b

class LocationCityLens a b | a -> b where
  locationCity :: Lens a b

class LocationCountryLens a b | a -> b where
  locationCountry :: Lens a b

class LocationLens a b | a -> b where
  location :: Lens a b

class LocationStateLens a b | a -> b where
  locationState :: Lens a b

class ManualLens a b | a -> b where
  manual :: Lens a b

class MapLens a b | a -> b where
  map :: Lens a b

class MarkdownLens a b | a -> b where
  markdown :: Lens a b

class MaxCatLens a b | a -> b where
  maxCat :: Lens a b

class MaxHeartrateLens a b | a -> b where
  maxHeartrate :: Lens a b

class MaxLens a b | a -> b where
  max_ :: Lens a b

class MaxSpeedLens a b | a -> b where
  maxSpeed :: Lens a b

class MaximumGradeLens a b | a -> b where
  maximumGrade :: Lens a b

class MeasurementPreferenceLens a b | a -> b where
  measurementPreference :: Lens a b

class MemberCountLens a b | a -> b where
  memberCount :: Lens a b

class MinCatLens a b | a -> b where
  minCat :: Lens a b

class MinLens a b | a -> b where
  min_ :: Lens a b

class ModelNameLens a b | a -> b where
  modelName :: Lens a b

class MovingTimeLens a b | a -> b where
  movingTime :: Lens a b

class MutualFriendCountLens a b | a -> b where
  mutualFriendCount :: Lens a b

class NameLens a b | a -> b where
  name :: Lens a b

class OriginalSizeLens a b | a -> b where
  originalSize :: Lens a b

class PageLens a b | a -> b where
  page :: Lens a b

class PerPageLens a b | a -> b where
  perPage :: Lens a b

class PhotoCountLens a b | a -> b where
  photoCount :: Lens a b

class PointsLens a b | a -> b where
  points :: Lens a b

class PolylineLens a b | a -> b where
  polyline :: Lens a b

class PrRankLens a b | a -> b where
  prRank :: Lens a b

class PremiumLens a b | a -> b where
  premium :: Lens a b

class PrimaryLens a b | a -> b where
  primary :: Lens a b

class PrivateLens a b | a -> b where
  private :: Lens a b

class PrivateScopeLens a b | a -> b where
  privateScope :: Lens a b

class ProfileLens a b | a -> b where
  profile :: Lens a b

class ProfileMediumLens a b | a -> b where
  profileMedium :: Lens a b

class RangeLens a b | a -> b where
  range :: Lens a b

class RankLens a b | a -> b where
  rank :: Lens a b

class RefLens a b | a -> b where
  ref :: Lens a b

class ResolutionLens a b | a -> b where
  resolution :: Lens a b

class ResourceStateLens a b | a -> b where
  resourceState :: Lens a b

class SegmentEffortsLens a b | a -> b where
  segmentEfforts :: Lens a b

class SegmentLens a b | a -> b where
  segment :: Lens a b

class SensorBasedLens a b | a -> b where
  sensorBased :: Lens a b

class SeriesTypeLens a b | a -> b where
  seriesType :: Lens a b

class SexLens a b | a -> b where
  sex :: Lens a b

class ShoesLens a b | a -> b where
  shoes :: Lens a b

class SportTypeLens a b | a -> b where
  sportType :: Lens a b

class StarCountLens a b | a -> b where
  starCount :: Lens a b

class StarredLens a b | a -> b where
  starred :: Lens a b

class StartDateLens a b | a -> b where
  startDate :: Lens a b

class StartDateLocalLens a b | a -> b where
  startDateLocal :: Lens a b

class StartIndexLens a b | a -> b where
  startIndex :: Lens a b

class StartLatitudeLens a b | a -> b where
  startLatitude :: Lens a b

class StartLatlngLens a b | a -> b where
  startLatlng :: Lens a b

class StartLongitudeLens a b | a -> b where
  startLongitude :: Lens a b

class StateLens a b | a -> b where
  state :: Lens a b

class StatusLens a b | a -> b where
  status :: Lens a b

class SummaryPolylineLens a b | a -> b where
  summaryPolyline :: Lens a b

class TextLens a b | a -> b where
  text :: Lens a b

class TimeLens a b | a -> b where
  time :: Lens a b

class TimezoneLens a b | a -> b where
  timezone :: Lens a b

class TotalElevationGainLens a b | a -> b where
  totalElevationGain :: Lens a b

class TrainerLens a b | a -> b where
  trainer :: Lens a b

class TruncatedLens a b | a -> b where
  truncated :: Lens a b

class TypeLens a b | a -> b where
  type_ :: Lens a b

class UidLens a b | a -> b where
  uid :: Lens a b

class UpdatedAtLens a b | a -> b where
  updatedAt :: Lens a b

class UploadIdLens a b | a -> b where
  uploadId :: Lens a b

class UploadedAtLens a b | a -> b where
  uploadedAt :: Lens a b

class WeightClassLens a b | a -> b where
  weightClass :: Lens a b

class WeightLens a b | a -> b where
  weight :: Lens a b

class WriteScopeLens a b | a -> b where
  writeScope :: Lens a b