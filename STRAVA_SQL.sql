-- LOAD ALL THE DATASETS

CREATE TABLE dailyactivity (
    Id BIGINT,
    ActivityDate DATE,
    TotalSteps INT,
    TotalDistance FLOAT,
    TrackerDistance FLOAT,
    LoggedActivitiesDistance FLOAT,
    VeryActiveDistance FLOAT,
    ModeratelyActiveDistance FLOAT,
    LightActiveDistance FLOAT,
    SedentaryActiveDistance FLOAT,
    VeryActiveMinutes INT,
    FairlyActiveMinutes INT,
    LightlyActiveMinutes INT,
    SedentaryMinutes INT,
    Calories INT
);
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dailyActivity_merged.csv"
INTO TABLE dailyactivity
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityDate, @TotalSteps, @TotalDistance, @TrackerDistance, @LoggedActivitiesDistance,
 @VeryActiveDistance, @ModeratelyActiveDistance, @LightActiveDistance, @SedentaryActiveDistance,
 @VeryActiveMinutes, @FairlyActiveMinutes, @LightlyActiveMinutes, @SedentaryMinutes, @Calories)
SET 
    Id = NULLIF(@Id, ''),
    ActivityDate = STR_TO_DATE(@ActivityDate, '%c/%e/%Y'),  -- Handles single-digit months/days
    TotalSteps = NULLIF(@TotalSteps, ''),
    TotalDistance = NULLIF(@TotalDistance, ''),
    TrackerDistance = NULLIF(@TrackerDistance, ''),
    LoggedActivitiesDistance = NULLIF(@LoggedActivitiesDistance, ''),
    VeryActiveDistance = NULLIF(@VeryActiveDistance, ''),
    ModeratelyActiveDistance = NULLIF(@ModeratelyActiveDistance, ''),
    LightActiveDistance = NULLIF(@LightActiveDistance, ''),
    SedentaryActiveDistance = NULLIF(@SedentaryActiveDistance, ''),
    VeryActiveMinutes = NULLIF(@VeryActiveMinutes, ''),
    FairlyActiveMinutes = NULLIF(@FairlyActiveMinutes, ''),
    LightlyActiveMinutes = NULLIF(@LightlyActiveMinutes, ''),
    SedentaryMinutes = NULLIF(@SedentaryMinutes, ''),
    Calories = NULLIF(@Calories, '');
    
CREATE TABLE dailycalories (
    Id BIGINT,
    ActivityDay DATE,
    Calories INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dailyCalories_merged.csv"
INTO TABLE dailycalories
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityDay, @Calories)
SET
    Id = NULLIF(@Id, ''),
    ActivityDay = STR_TO_DATE(@ActivityDay, '%c/%e/%Y'),
    Calories = NULLIF(@Calories, '');
    
CREATE TABLE dailyintensities (
    Id BIGINT,
    ActivityDay DATE,
    SedentaryMinutes INT,
    LightlyActiveMinutes INT,
    FairlyActiveMinutes INT,
    VeryActiveMinutes INT,
    SedentaryActiveDistance int, 
	LightActiveDistance double, 
    ModeratelyActiveDistance double, 
    VeryActiveDistance double
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dailyIntensities_merged.csv"
INTO TABLE dailyintensities
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityDay, @SedentaryMinutes, @LightlyActiveMinutes, @FairlyActiveMinutes, @VeryActiveMinutes, @SedentaryActiveDistance, 
@LightActiveDistance,@ModeratelyActiveDistance,@VeryActiveDistance)
SET
    Id = NULLIF(@Id, ''),
    ActivityDay = STR_TO_DATE(@ActivityDay, '%c/%e/%Y'),
    SedentaryMinutes = NULLIF(@SedentaryMinutes, ''),
    LightlyActiveMinutes = NULLIF(@LightlyActiveMinutes, ''),
    FairlyActiveMinutes = NULLIF(@FairlyActiveMinutes, ''),
    VeryActiveMinutes = NULLIF(@VeryActiveMinutes, ''),
    SedentaryActiveDistance = NULLIF(@SedentaryActiveDistance, ''),
    LightActiveDistance = NULLIF(@LightActiveDistance, ''),
    ModeratelyActiveDistance = NULLIF(@ModeratelyActiveDistance, ''),
    VeryActiveDistance = NULLIF(@VeryActiveDistance, '');
    
CREATE TABLE dailysteps (
    Id BIGINT,
    ActivityDay DATE,
    StepTotal INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dailySteps_merged.csv"
INTO TABLE dailysteps
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityDay, @StepTotal)
SET
    Id = NULLIF(@Id, ''),
    ActivityDay = STR_TO_DATE(@ActivityDay, '%c/%e/%Y'),
    StepTotal = NULLIF(@StepTotal, '');

CREATE TABLE heartrateseconds (
    Id BIGINT,
    Time DATETIME,
    Value INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\heartrate_seconds_merged.csv"
INTO TABLE heartrateseconds
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @Time, @Value)
SET
    Id = NULLIF(@Id, ''),
    Time = STR_TO_DATE(@Time, '%m/%d/%Y %r'),  
    Value = NULLIF(@Value, '');

CREATE TABLE hourlycalories (
    Id BIGINT,
    ActivityHour DATETIME,
    Calories INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hourlyCalories_merged.csv"
INTO TABLE hourlycalories
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityHour, @Calories)
SET
    Id = NULLIF(@Id, ''),
    ActivityHour = STR_TO_DATE(@ActivityHour, '%m/%d/%Y %r'),
    Calories = NULLIF(@Calories, '');
 
 CREATE TABLE hourlyintensities (
    Id BIGINT,
    ActivityHour DATETIME,
    TotalIntensity INT,
    AverageIntensity DOUBLE
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hourlyIntensities_merged.csv"
INTO TABLE hourlyintensities
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityHour, @TotalIntensity, @AverageIntensity)
SET
    Id = NULLIF(@Id, ''),
    ActivityHour = STR_TO_DATE(@ActivityHour, '%m/%d/%Y %r'),
    TotalIntensity = NULLIF(@TotalIntensity, ''),
    AverageIntensity = NULLIF(@AverageIntensity, '');

CREATE TABLE hourlysteps (
    Id BIGINT,
    ActivityHour DATETIME,
    StepTotal INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hourlySteps_merged.csv"
INTO TABLE hourlysteps
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityHour, @StepTotal)
SET
    Id = NULLIF(@Id, ''),
    ActivityHour = STR_TO_DATE(@ActivityHour, '%m/%d/%Y %r'),
    StepTotal = NULLIF(@StepTotal, '');

 CREATE TABLE minutecaloriesnarrow (
    Id BIGINT,
    ActivityMinute DATETIME,
    Calories FLOAT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteCaloriesNarrow_merged.csv"
INTO TABLE minutecaloriesnarrow
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityMinute, @Calories)
SET
    Id = NULLIF(@Id, ''),
    ActivityMinute = STR_TO_DATE(@ActivityMinute, '%m/%d/%Y %r'),
    Calories = NULLIF(@Calories, '');
    

CREATE TABLE minutecalorieswide (
    Id BIGINT,
    ActivityMinute DATETIME,
    Calories00 DOUBLE,
    Calories01 DOUBLE,
    Calories02 DOUBLE,
    Calories03 DOUBLE,
    Calories04 DOUBLE,
    Calories05 DOUBLE,
    Calories06 DOUBLE,
    Calories07 DOUBLE,
    Calories08 DOUBLE,
    Calories09 DOUBLE,
    Calories10 DOUBLE,
    Calories11 DOUBLE,
    Calories12 DOUBLE,
    Calories13 DOUBLE,
    Calories14 DOUBLE,
    Calories15 DOUBLE,
    Calories16 DOUBLE,
    Calories17 DOUBLE,
    Calories18 DOUBLE,
    Calories19 DOUBLE,
    Calories20 DOUBLE,
    Calories21 DOUBLE,
    Calories22 DOUBLE,
    Calories23 DOUBLE,
    Calories24 DOUBLE,
    Calories25 DOUBLE,
    Calories26 DOUBLE,
    Calories27 DOUBLE,
    Calories28 DOUBLE,
    Calories29 DOUBLE,
    Calories30 DOUBLE,
    Calories31 DOUBLE,
    Calories32 DOUBLE,
    Calories33 DOUBLE,
    Calories34 DOUBLE,
    Calories35 DOUBLE,
    Calories36 DOUBLE,
    Calories37 DOUBLE,
    Calories38 DOUBLE,
    Calories39 DOUBLE,
    Calories40 DOUBLE,
    Calories41 DOUBLE,
    Calories42 DOUBLE,
    Calories43 DOUBLE,
    Calories44 DOUBLE,
    Calories45 DOUBLE,
    Calories46 DOUBLE,
    Calories47 DOUBLE,
    Calories48 DOUBLE,
    Calories49 DOUBLE,
    Calories50 DOUBLE,
    Calories51 DOUBLE,
    Calories52 DOUBLE,
    Calories53 DOUBLE,
    Calories54 DOUBLE,
    Calories55 DOUBLE,
    Calories56 DOUBLE,
    Calories57 DOUBLE,
    Calories58 DOUBLE,
    Calories59 DOUBLE
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteCaloriesWide_merged.csv'
INTO TABLE minutecalorieswide
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityMinute,
 @Calories00, @Calories01, @Calories02, @Calories03, @Calories04, @Calories05, @Calories06, @Calories07, @Calories08, @Calories09,
 @Calories10, @Calories11, @Calories12, @Calories13, @Calories14, @Calories15, @Calories16, @Calories17, @Calories18, @Calories19,
 @Calories20, @Calories21, @Calories22, @Calories23, @Calories24, @Calories25, @Calories26, @Calories27, @Calories28, @Calories29,
 @Calories30, @Calories31, @Calories32, @Calories33, @Calories34, @Calories35, @Calories36, @Calories37, @Calories38, @Calories39,
 @Calories40, @Calories41, @Calories42, @Calories43, @Calories44, @Calories45, @Calories46, @Calories47, @Calories48, @Calories49,
 @Calories50, @Calories51, @Calories52, @Calories53, @Calories54, @Calories55, @Calories56, @Calories57, @Calories58, @Calories59)
SET
    Id = NULLIF(@Id, ''),
    ActivityMinute = STR_TO_DATE(@ActivityMinute, '%m/%d/%Y %r'),
    Calories00 = NULLIF(@Calories00, ''),
    Calories01 = NULLIF(@Calories01, ''),
    Calories02 = NULLIF(@Calories02, ''),
    Calories03 = NULLIF(@Calories03, ''),
    Calories04 = NULLIF(@Calories04, ''),
    Calories05 = NULLIF(@Calories05, ''),
    Calories06 = NULLIF(@Calories06, ''),
    Calories07 = NULLIF(@Calories07, ''),
    Calories08 = NULLIF(@Calories08, ''),
    Calories09 = NULLIF(@Calories09, ''),
    Calories10 = NULLIF(@Calories10, ''),
    Calories11 = NULLIF(@Calories11, ''),
    Calories12 = NULLIF(@Calories12, ''),
    Calories13 = NULLIF(@Calories13, ''),
    Calories14 = NULLIF(@Calories14, ''),
    Calories15 = NULLIF(@Calories15, ''),
    Calories16 = NULLIF(@Calories16, ''),
    Calories17 = NULLIF(@Calories17, ''),
    Calories18 = NULLIF(@Calories18, ''),
    Calories19 = NULLIF(@Calories19, ''),
    Calories20 = NULLIF(@Calories20, ''),
    Calories21 = NULLIF(@Calories21, ''),
    Calories22 = NULLIF(@Calories22, ''),
    Calories23 = NULLIF(@Calories23, ''),
    Calories24 = NULLIF(@Calories24, ''),
    Calories25 = NULLIF(@Calories25, ''),
    Calories26 = NULLIF(@Calories26, ''),
    Calories27 = NULLIF(@Calories27, ''),
    Calories28 = NULLIF(@Calories28, ''),
    Calories29 = NULLIF(@Calories29, ''),
    Calories30 = NULLIF(@Calories30, ''),
    Calories31 = NULLIF(@Calories31, ''),
    Calories32 = NULLIF(@Calories32, ''),
    Calories33 = NULLIF(@Calories33, ''),
    Calories34 = NULLIF(@Calories34, ''),
    Calories35 = NULLIF(@Calories35, ''),
    Calories36 = NULLIF(@Calories36, ''),
    Calories37 = NULLIF(@Calories37, ''),
    Calories38 = NULLIF(@Calories38, ''),
    Calories39 = NULLIF(@Calories39, ''),
    Calories40 = NULLIF(@Calories40, ''),
    Calories41 = NULLIF(@Calories41, ''),
    Calories42 = NULLIF(@Calories42, ''),
    Calories43 = NULLIF(@Calories43, ''),
    Calories44 = NULLIF(@Calories44, ''),
    Calories45 = NULLIF(@Calories45, ''),
    Calories46 = NULLIF(@Calories46, ''),
    Calories47 = NULLIF(@Calories47, ''),
    Calories48 = NULLIF(@Calories48, ''),
    Calories49 = NULLIF(@Calories49, ''),
    Calories50 = NULLIF(@Calories50, ''),
    Calories51 = NULLIF(@Calories51, ''),
    Calories52 = NULLIF(@Calories52, ''),
    Calories53 = NULLIF(@Calories53, ''),
    Calories54 = NULLIF(@Calories54, ''),
    Calories55 = NULLIF(@Calories55, ''),
    Calories56 = NULLIF(@Calories56, ''),
    Calories57 = NULLIF(@Calories57, ''),
    Calories58 = NULLIF(@Calories58, ''),
    Calories59 = NULLIF(@Calories59, '');

CREATE TABLE minuteintensitiesnarrow (
    Id BIGINT,
    ActivityMinute DATETIME,
    Intensity INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteIntensitiesNarrow_merged.csv"
INTO TABLE minuteintensitiesnarrow
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityMinute, @Intensity)
SET
    Id = NULLIF(@Id, ''),
    ActivityMinute = STR_TO_DATE(@ActivityMinute, '%m/%d/%Y %r'),
    Intensity = NULLIF(@Intensity, '');

CREATE TABLE minuteintensitieswide (
    Id BIGINT,
    ActivityHour DATETIME,
    Intensity00 INT,
    Intensity01 INT,
    Intensity02 INT,
    Intensity03 INT,
    Intensity04 INT,
    Intensity05 INT,
    Intensity06 INT,
    Intensity07 INT,
    Intensity08 INT,
    Intensity09 INT,
    Intensity10 INT,
    Intensity11 INT,
    Intensity12 INT,
    Intensity13 INT,
    Intensity14 INT,
    Intensity15 INT,
    Intensity16 INT,
    Intensity17 INT,
    Intensity18 INT,
    Intensity19 INT,
    Intensity20 INT,
    Intensity21 INT,
    Intensity22 INT,
    Intensity23 INT,
    Intensity24 INT,
    Intensity25 INT,
    Intensity26 INT,
    Intensity27 INT,
    Intensity28 INT,
    Intensity29 INT,
    Intensity30 INT,
    Intensity31 INT,
    Intensity32 INT,
    Intensity33 INT,
    Intensity34 INT,
    Intensity35 INT,
    Intensity36 INT,
    Intensity37 INT,
    Intensity38 INT,
    Intensity39 INT,
    Intensity40 INT,
    Intensity41 INT,
    Intensity42 INT,
    Intensity43 INT,
    Intensity44 INT,
    Intensity45 INT,
    Intensity46 INT,
    Intensity47 INT,
    Intensity48 INT,
    Intensity49 INT,
    Intensity50 INT,
    Intensity51 INT,
    Intensity52 INT,
    Intensity53 INT,
    Intensity54 INT,
    Intensity55 INT,
    Intensity56 INT,
    Intensity57 INT,
    Intensity58 INT,
    Intensity59 INT
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteIntensitiesWide_merged.csv'
INTO TABLE minuteintensitieswide
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityHour,
 @Intensity00, @Intensity01, @Intensity02, @Intensity03, @Intensity04, @Intensity05, @Intensity06, @Intensity07, @Intensity08, @Intensity09,
 @Intensity10, @Intensity11, @Intensity12, @Intensity13, @Intensity14, @Intensity15, @Intensity16, @Intensity17, @Intensity18, @Intensity19,
 @Intensity20, @Intensity21, @Intensity22, @Intensity23, @Intensity24, @Intensity25, @Intensity26, @Intensity27, @Intensity28, @Intensity29,
 @Intensity30, @Intensity31, @Intensity32, @Intensity33, @Intensity34, @Intensity35, @Intensity36, @Intensity37, @Intensity38, @Intensity39,
 @Intensity40, @Intensity41, @Intensity42, @Intensity43, @Intensity44, @Intensity45, @Intensity46, @Intensity47, @Intensity48, @Intensity49,
 @Intensity50, @Intensity51, @Intensity52, @Intensity53, @Intensity54, @Intensity55, @Intensity56, @Intensity57, @Intensity58, @Intensity59)
SET
    Id = NULLIF(@Id, ''),
    ActivityHour = STR_TO_DATE(@ActivityHour, '%m/%d/%Y %r'),
    Intensity00 = NULLIF(@Intensity00, ''),
    Intensity01 = NULLIF(@Intensity01, ''),
    Intensity02 = NULLIF(@Intensity02, ''),
    Intensity03 = NULLIF(@Intensity03, ''),
    Intensity04 = NULLIF(@Intensity04, ''),
    Intensity05 = NULLIF(@Intensity05, ''),
    Intensity06 = NULLIF(@Intensity06, ''),
    Intensity07 = NULLIF(@Intensity07, ''),
    Intensity08 = NULLIF(@Intensity08, ''),
    Intensity09 = NULLIF(@Intensity09, ''),
    Intensity10 = NULLIF(@Intensity10, ''),
    Intensity11 = NULLIF(@Intensity11, ''),
    Intensity12 = NULLIF(@Intensity12, ''),
    Intensity13 = NULLIF(@Intensity13, ''),
    Intensity14 = NULLIF(@Intensity14, ''),
    Intensity15 = NULLIF(@Intensity15, ''),
    Intensity16 = NULLIF(@Intensity16, ''),
    Intensity17 = NULLIF(@Intensity17, ''),
    Intensity18 = NULLIF(@Intensity18, ''),
    Intensity19 = NULLIF(@Intensity19, ''),
    Intensity20 = NULLIF(@Intensity20, ''),
    Intensity21 = NULLIF(@Intensity21, ''),
    Intensity22 = NULLIF(@Intensity22, ''),
    Intensity23 = NULLIF(@Intensity23, ''),
    Intensity24 = NULLIF(@Intensity24, ''),
    Intensity25 = NULLIF(@Intensity25, ''),
    Intensity26 = NULLIF(@Intensity26, ''),
    Intensity27 = NULLIF(@Intensity27, ''),
    Intensity28 = NULLIF(@Intensity28, ''),
    Intensity29 = NULLIF(@Intensity29, ''),
    Intensity30 = NULLIF(@Intensity30, ''),
    Intensity31 = NULLIF(@Intensity31, ''),
    Intensity32 = NULLIF(@Intensity32, ''),
    Intensity33 = NULLIF(@Intensity33, ''),
    Intensity34 = NULLIF(@Intensity34, ''),
    Intensity35 = NULLIF(@Intensity35, ''),
    Intensity36 = NULLIF(@Intensity36, ''),
    Intensity37 = NULLIF(@Intensity37, ''),
    Intensity38 = NULLIF(@Intensity38, ''),
    Intensity39 = NULLIF(@Intensity39, ''),
    Intensity40 = NULLIF(@Intensity40, ''),
    Intensity41 = NULLIF(@Intensity41, ''),
    Intensity42 = NULLIF(@Intensity42, ''),
    Intensity43 = NULLIF(@Intensity43, ''),
    Intensity44 = NULLIF(@Intensity44, ''),
    Intensity45 = NULLIF(@Intensity45, ''),
    Intensity46 = NULLIF(@Intensity46, ''),
    Intensity47 = NULLIF(@Intensity47, ''),
    Intensity48 = NULLIF(@Intensity48, ''),
    Intensity49 = NULLIF(@Intensity49, ''),
    Intensity50 = NULLIF(@Intensity50, ''),
    Intensity51 = NULLIF(@Intensity51, ''),
    Intensity52 = NULLIF(@Intensity52, ''),
    Intensity53 = NULLIF(@Intensity53, ''),
    Intensity54 = NULLIF(@Intensity54, ''),
    Intensity55 = NULLIF(@Intensity55, ''),
    Intensity56 = NULLIF(@Intensity56, ''),
    Intensity57 = NULLIF(@Intensity57, ''),
    Intensity58 = NULLIF(@Intensity58, ''),
    Intensity59 = NULLIF(@Intensity59, '');
    
    
CREATE TABLE minutemetsnarrow (
    Id BIGINT,
    ActivityMinute DATETIME,
    METs INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteMETsNarrow_merged.csv"
INTO TABLE minutemetsnarrow
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityMinute, @METs)
SET
    Id = NULLIF(@Id, ''),
    ActivityMinute = STR_TO_DATE(@ActivityMinute, '%m/%d/%Y %r'),
    METs = NULLIF(@METs, '');
    
CREATE TABLE minutesleep (
    Id BIGINT,
    Date DATETIME,
    Value INT,
    LogId BIGINT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteSleep_merged.csv"
INTO TABLE minutesleep
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @Date, @Value, @LogId)
SET
    Id = NULLIF(@Id, ''),
    Date = STR_TO_DATE(@Date, '%m/%d/%Y %r'),
    Value = NULLIF(@Value, ''),
    LogId = NULLIF(@LogId, '');
    
CREATE TABLE minutestepsnarrow (
    Id BIGINT,
    ActivityMinute DATETIME,
    Steps INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteStepsNarrow_merged.csv"
INTO TABLE minutestepsnarrow
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityMinute, @Steps)
SET
    Id = NULLIF(@Id, ''),
    ActivityMinute = STR_TO_DATE(@ActivityMinute, '%m/%d/%Y %r'),
    Steps = NULLIF(@Steps, '');
    
CREATE TABLE minutestepswide (
    Id BIGINT,
    ActivityHour DATETIME,
    Steps00 INT,
    Steps01 INT,
    Steps02 INT,
    Steps03 INT,
    Steps04 INT,
    Steps05 INT,
    Steps06 INT,
    Steps07 INT,
    Steps08 INT,
    Steps09 INT,
    Steps10 INT,
    Steps11 INT,
    Steps12 INT,
    Steps13 INT,
    Steps14 INT,
    Steps15 INT,
    Steps16 INT,
    Steps17 INT,
    Steps18 INT,
    Steps19 INT,
    Steps20 INT,
    Steps21 INT,
    Steps22 INT,
    Steps23 INT,
    Steps24 INT,
    Steps25 INT,
    Steps26 INT,
    Steps27 INT,
    Steps28 INT,
    Steps29 INT,
    Steps30 INT,
    Steps31 INT,
    Steps32 INT,
    Steps33 INT,
    Steps34 INT,
    Steps35 INT,
    Steps36 INT,
    Steps37 INT,
    Steps38 INT,
    Steps39 INT,
    Steps40 INT,
    Steps41 INT,
    Steps42 INT,
    Steps43 INT,
    Steps44 INT,
    Steps45 INT,
    Steps46 INT,
    Steps47 INT,
    Steps48 INT,
    Steps49 INT,
    Steps50 INT,
    Steps51 INT,
    Steps52 INT,
    Steps53 INT,
    Steps54 INT,
    Steps55 INT,
    Steps56 INT,
    Steps57 INT,
    Steps58 INT,
    Steps59 INT
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minuteStepsWide_merged.csv'
INTO TABLE minutestepswide
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @ActivityHour,
 @Steps00, @Steps01, @Steps02, @Steps03, @Steps04, @Steps05, @Steps06, @Steps07, @Steps08, @Steps09,
 @Steps10, @Steps11, @Steps12, @Steps13, @Steps14, @Steps15, @Steps16, @Steps17, @Steps18, @Steps19,
 @Steps20, @Steps21, @Steps22, @Steps23, @Steps24, @Steps25, @Steps26, @Steps27, @Steps28, @Steps29,
 @Steps30, @Steps31, @Steps32, @Steps33, @Steps34, @Steps35, @Steps36, @Steps37, @Steps38, @Steps39,
 @Steps40, @Steps41, @Steps42, @Steps43, @Steps44, @Steps45, @Steps46, @Steps47, @Steps48, @Steps49,
 @Steps50, @Steps51, @Steps52, @Steps53, @Steps54, @Steps55, @Steps56, @Steps57, @Steps58, @Steps59)
SET
    Id = NULLIF(@Id, ''),
    ActivityHour = STR_TO_DATE(@ActivityHour, '%m/%d/%Y %r'),
    Steps00 = NULLIF(@Steps00, ''),
    Steps01 = NULLIF(@Steps01, ''),
    Steps02 = NULLIF(@Steps02, ''),
    Steps03 = NULLIF(@Steps03, ''),
    Steps04 = NULLIF(@Steps04, ''),
    Steps05 = NULLIF(@Steps05, ''),
    Steps06 = NULLIF(@Steps06, ''),
    Steps07 = NULLIF(@Steps07, ''),
    Steps08 = NULLIF(@Steps08, ''),
    Steps09 = NULLIF(@Steps09, ''),
    Steps10 = NULLIF(@Steps10, ''),
    Steps11 = NULLIF(@Steps11, ''),
    Steps12 = NULLIF(@Steps12, ''),
    Steps13 = NULLIF(@Steps13, ''),
    Steps14 = NULLIF(@Steps14, ''),
    Steps15 = NULLIF(@Steps15, ''),
    Steps16 = NULLIF(@Steps16, ''),
    Steps17 = NULLIF(@Steps17, ''),
    Steps18 = NULLIF(@Steps18, ''),
    Steps19 = NULLIF(@Steps19, ''),
    Steps20 = NULLIF(@Steps20, ''),
    Steps21 = NULLIF(@Steps21, ''),
    Steps22 = NULLIF(@Steps22, ''),
    Steps23 = NULLIF(@Steps23, ''),
    Steps24 = NULLIF(@Steps24, ''),
    Steps25 = NULLIF(@Steps25, ''),
    Steps26 = NULLIF(@Steps26, ''),
    Steps27 = NULLIF(@Steps27, ''),
    Steps28 = NULLIF(@Steps28, ''),
    Steps29 = NULLIF(@Steps29, ''),
    Steps30 = NULLIF(@Steps30, ''),
    Steps31 = NULLIF(@Steps31, ''),
    Steps32 = NULLIF(@Steps32, ''),
    Steps33 = NULLIF(@Steps33, ''),
    Steps34 = NULLIF(@Steps34, ''),
    Steps35 = NULLIF(@Steps35, ''),
    Steps36 = NULLIF(@Steps36, ''),
    Steps37 = NULLIF(@Steps37, ''),
    Steps38 = NULLIF(@Steps38, ''),
    Steps39 = NULLIF(@Steps39, ''),
    Steps40 = NULLIF(@Steps40, ''),
    Steps41 = NULLIF(@Steps41, ''),
    Steps42 = NULLIF(@Steps42, ''),
    Steps43 = NULLIF(@Steps43, ''),
    Steps44 = NULLIF(@Steps44, ''),
    Steps45 = NULLIF(@Steps45, ''),
    Steps46 = NULLIF(@Steps46, ''),
    Steps47 = NULLIF(@Steps47, ''),
    Steps48 = NULLIF(@Steps48, ''),
    Steps49 = NULLIF(@Steps49, ''),
    Steps50 = NULLIF(@Steps50, ''),
    Steps51 = NULLIF(@Steps51, ''),
    Steps52 = NULLIF(@Steps52, ''),
    Steps53 = NULLIF(@Steps53, ''),
    Steps54 = NULLIF(@Steps54, ''),
    Steps55 = NULLIF(@Steps55, ''),
    Steps56 = NULLIF(@Steps56, ''),
    Steps57 = NULLIF(@Steps57, ''),
    Steps58 = NULLIF(@Steps58, ''),
    Steps59 = NULLIF(@Steps59, '');
    
CREATE TABLE sleepday (
    Id BIGINT,
    SleepDay DATETIME,
    TotalSleepRecords INT,
    TotalMinutesAsleep INT,
    TotalTimeInBed INT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sleepDay_merged.csv"
INTO TABLE sleepday
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @SleepDay, @TotalSleepRecords, @TotalMinutesAsleep, @TotalTimeInBed)
SET
    Id = NULLIF(@Id, ''),
    SleepDay = STR_TO_DATE(@SleepDay, '%m/%d/%Y %r'),
    TotalSleepRecords = NULLIF(@TotalSleepRecords, ''),
    TotalMinutesAsleep = NULLIF(@TotalMinutesAsleep, ''),
    TotalTimeInBed = NULLIF(@TotalTimeInBed, '');

CREATE TABLE weightloginfo (
    Id BIGINT,
    Date DATETIME,
    WeightKg DOUBLE,
    WeightPounds DOUBLE,
    Fat BIGINT,
    BMI DOUBLE,
    IsManualReport BOOLEAN,
    LogId BIGINT
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\weightLogInfo_merged.csv"
INTO TABLE weightloginfo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Id, @Date, @WeightKg, @WeightPounds, @Fat, @BMI, @IsManualReport, @LogId)
SET
    Id = NULLIF(@Id, ''),
    Date = STR_TO_DATE(@Date, '%m/%d/%Y %r'),
    WeightKg = NULLIF(@WeightKg, ''),
	WeightPounds = NULLIF(@WeightPounds, ''),
    Fat = NULLIF(@Fat, ''),
    BMI = NULLIF(@BMI, ''),
    IsManualReport = IF(@IsManualReport = 'TRUE', TRUE, FALSE),
    LogId = NULLIF(@LogId, '');

-- MERGE DAILY DATA INTO ONE TABLE 

CREATE TABLE daily_merged_data AS
SELECT 
     -- dailyactivity
    da.Id,
    da.ActivityDate,
    da.TotalSteps,
    da.TotalDistance,
    da.TrackerDistance,
    da.LoggedActivitiesDistance,
    da.VeryActiveDistance,
    da.ModeratelyActiveDistance,
    da.LightActiveDistance,
    da.SedentaryActiveDistance,
    da.VeryActiveMinutes,
    da.FairlyActiveMinutes,
    da.LightlyActiveMinutes,
    da.SedentaryMinutes,
    da.Calories AS activity_calories,

    -- Daily Calories
    dc.Calories AS daily_calories,

    -- Daily Intensities
    di.SedentaryMinutes AS di_SedentaryMinutes,
    di.LightlyActiveMinutes AS di_LightlyActiveMinutes,
    di.FairlyActiveMinutes AS di_FairlyActiveMinutes,
    di.VeryActiveMinutes AS di_VeryActiveMinutes,
    di.SedentaryActiveDistance AS di_SedentaryActiveDistance,
    di.LightActiveDistance AS di_LightActiveDistance,
    di.ModeratelyActiveDistance AS di_ModeratelyActiveDistance,
    di.VeryActiveDistance AS di_VeryActiveDistance,

    -- Daily Steps 
    ds.StepTotal AS ds_step_total,

    -- Heart Rate (daily average)
    hr.avg_heart_rate,
    
    -- Sleep Day 
    sl.TotalSleepRecords,
    sl.TotalMinutesAsleep,
    sl.TotalTimeInBed,
    
    -- weight log info
    wl.WeightKg,
    wl.WeightPounds,
    wl.Fat,
    wl.BMI,
    wl.LogId
    
FROM dailyactivity AS da

-- JOIN with daily_calories
LEFT JOIN dailycalories AS dc 
  ON da.Id = dc.Id AND da.ActivityDate = dc.ActivityDay

-- JOIN with daily_intensities
LEFT JOIN dailyintensities as di 
  ON da.Id = di.Id AND da.ActivityDate = di.ActivityDay

-- JOIN with daily_steps
LEFT JOIN dailysteps as ds 
  ON da.Id = ds.Id AND da.ActivityDate = ds.ActivityDay

-- JOIN with average daily heart rate
LEFT JOIN (
    SELECT 
        Id, 
        DATE(Time) AS HR_Date, 
        ROUND(AVG(Value), 2) AS avg_heart_rate
    FROM heartrateseconds
    GROUP BY Id, HR_Date
) as hr
  ON da.Id = hr.Id AND da.ActivityDate = hr.HR_Date

-- JOIN with sleep data 
LEFT JOIN sleepday as sl 
  ON da.Id = sl.Id AND da.ActivityDate = date(sl.SleepDay)
  
-- JOIN with weight data 
LEFT JOIN (
    SELECT 
        Id, 
        DATE(Date) AS WeightDate,
        WeightKg,
        WeightPounds,
        Fat,
        BMI,
        LogId
    FROM weightloginfo
) AS wl 
  ON da.Id = wl.Id AND da.ActivityDate = wl.WeightDate;
  
-- MERGE TIME BASED DATA INTO ANOTHER TABLE 

CREATE TABLE timebased_merged_data AS
SELECT
    -- hourly calories
    hc.Id,
    hc.ActivityHour AS TimeStamp,
	hc.Calories AS hourly_calories,
    
    -- hourly intensities
    hi.TotalIntensity AS hourly_total_intensity,
    hi.AverageIntensity AS hourly_avg_intensity,
    
    -- hourly steps
    hs.StepTotal AS hourly_steps,
    
    -- minute calories narrow
    mcn.Calories AS minute_calories_narrow,
    
    -- minute calories wide
     mcw.Calories00 AS calories_wide00,
	 mcw.Calories01 AS calories_wide01,
	 mcw.Calories02 AS calories_wide02,
	 mcw.Calories03 AS calories_wide03,
	 mcw.Calories04 AS calories_wide04,
     mcw.Calories05 AS calories_wide05,
     mcw.Calories06 AS calories_wide06,
     mcw.Calories07 AS calories_wide07,
     mcw.Calories08 AS calories_wide08,
     mcw.Calories09 AS calories_wide09,
     mcw.Calories10 AS calories_wide10,
     mcw.Calories11 AS calories_wide11,
     mcw.Calories12 AS calories_wide12,
     mcw.Calories13 AS calories_wide13,
     mcw.Calories14 AS calories_wide14,
     mcw.Calories15 AS calories_wide15,
     mcw.Calories16 AS calories_wide16,
     mcw.Calories17 AS calories_wide17,
     mcw.Calories18 AS calories_wide18,
     mcw.Calories19 AS calories_wide19,
     mcw.Calories20 AS calories_wide20,
     mcw.Calories21 AS calories_wide21,
     mcw.Calories22 AS calories_wide22,
     mcw.Calories23 AS calories_wide23,
     mcw.Calories24 AS calories_wide24,
     mcw.Calories25 AS calories_wide25,
     mcw.Calories26 AS calories_wide26,
	 mcw.Calories27 AS calories_wide27,
	 mcw.Calories28 AS calories_wide28,
     mcw.Calories29 AS calories_wide29,
	 mcw.Calories30 AS calories_wide30,
     mcw.Calories31 AS calories_wide31,
     mcw.Calories32 AS calories_wide32,
     mcw.Calories33 AS calories_wide33,
     mcw.Calories34 AS calories_wide34,
     mcw.Calories35 AS calories_wide35,
	 mcw.Calories36 AS calories_wide36,
     mcw.Calories37 AS calories_wide37,
     mcw.Calories38 AS calories_wide38,
     mcw.Calories39 AS calories_wide39,
	 mcw.Calories40 AS calories_wide40,
     mcw.Calories41 AS calories_wide41,
     mcw.Calories42 AS calories_wide42,
     mcw.Calories43 AS calories_wide43,
     mcw.Calories44 AS calories_wide44,
     mcw.Calories45 AS calories_wide45,
     mcw.Calories46 AS calories_wide46,
     mcw.Calories47 AS calories_wide47,
     mcw.Calories48 AS calories_wide48,
     mcw.Calories49 AS calories_wide49,
     mcw.Calories50 AS calories_wide50,
     mcw.Calories51 AS calories_wide51,
     mcw.Calories52 AS calories_wide52,
     mcw.Calories53 AS calories_wide53,
     mcw.Calories54 AS calories_wide54,
     mcw.Calories55 AS calories_wide55,
     mcw.Calories56 AS calories_wide56,
     mcw.Calories57 AS calories_wide57,
     mcw.Calories58 AS calories_wide58,
     mcw.Calories59 AS calories_wide59,
     
     -- minute intensities narrow
     minin.Intensity AS minute_intensity_narrow,
    
    -- minute intensities wide
     miniw.Intensity00 AS intensity_wide00,
     miniw.Intensity01 AS intensity_wide01,
     miniw.Intensity02 AS intensity_wide02,
	 miniw.Intensity03 AS intensity_wide03,
     miniw.Intensity04 AS intensity_wide04,
     miniw.Intensity05 AS intensity_wide05,
     miniw.Intensity06 AS intensity_wide06,
     miniw.Intensity07 AS intensity_wide07,
     miniw.Intensity08 AS intensity_wide08,
     miniw.Intensity09 AS intensity_wide09,
     miniw.Intensity10 AS intensity_wide10,
     miniw.Intensity11 AS intensity_wide11,
     miniw.Intensity12 AS intensity_wide12,
     miniw.Intensity13 AS intensity_wide13,
     miniw.Intensity14 AS intensity_wide14,
     miniw.Intensity15 AS intensity_wide15,
	 miniw.Intensity16 AS intensity_wide16,
     miniw.Intensity17 AS intensity_wide17,
     miniw.Intensity18 AS intensity_wide18,
     miniw.Intensity19 AS intensity_wide19,
     miniw.Intensity20 AS intensity_wide20,
     miniw.Intensity21 AS intensity_wide21,
     miniw.Intensity22 AS intensity_wide22,
     miniw.Intensity23 AS intensity_wide23,
     miniw.Intensity24 AS intensity_wide24,
     miniw.Intensity25 AS intensity_wide25,
     miniw.Intensity26 AS intensity_wide26,
     miniw.Intensity27 AS intensity_wide27,
	 miniw.Intensity28 AS intensity_wide28,
     miniw.Intensity29 AS intensity_wide29,
     miniw.Intensity30 AS intensity_wide30,
     miniw.Intensity31 AS intensity_wide31,
     miniw.Intensity32 AS intensity_wide32,
     miniw.Intensity33 AS intensity_wide33,
     miniw.Intensity34 AS intensity_wide34,
     miniw.Intensity35 AS intensity_wide35,
     miniw.Intensity36 AS intensity_wide36,
     miniw.Intensity37 AS intensity_wide37,
	 miniw.Intensity38 AS intensity_wide38,
     miniw.Intensity39 AS intensity_wide39,
     miniw.Intensity40 AS intensity_wide40,
     miniw.Intensity41 AS intensity_wide41,
     miniw.Intensity42 AS intensity_wide42,
     miniw.Intensity43 AS intensity_wide43,
     miniw.Intensity44 AS intensity_wide44,
     miniw.Intensity45 AS intensity_wide45,
     miniw.Intensity46 AS intensity_wide46,
     miniw.Intensity47 AS intensity_wide47,
     miniw.Intensity48 AS intensity_wide48,
     miniw.Intensity49 AS intensity_wide49,
     miniw.Intensity50 AS intensity_wide50,
     miniw.Intensity51 AS intensity_wide51,
     miniw.Intensity52 AS intensity_wide52,
     miniw.Intensity53 AS intensity_wide53,
     miniw.Intensity54 AS intensity_wide54,
     miniw.Intensity55 AS intensity_wide55,
     miniw.Intensity56 AS intensity_wide56,
     miniw.Intensity57 AS intensity_wide57,
     miniw.Intensity58 AS intensity_wide58,
     miniw.Intensity59 AS intensity_wide59,
     
     -- minute met snarrow
     mm.METs AS minute_mets,

    -- minutesleep
     ms.Value AS minute_sleep_value,
     
     -- minute steps narrow
      msn.Steps AS minute_steps_narrow,
      
	-- minute steps wide
     msw.Steps00 AS minute_steps_wide00,
     msw.Steps01 AS minute_steps_wide01,
     msw.Steps02 AS minute_steps_wide02,
     msw.Steps03 AS minute_steps_wide03,
	 msw.Steps04 AS minute_steps_wide04,
     msw.Steps05 AS minute_steps_wide05,
     msw.Steps06 AS minute_steps_wide06,
     msw.Steps07 AS minute_steps_wide07,
     msw.Steps08 AS minute_steps_wide08,
     msw.Steps09 AS minute_steps_wide09,
     msw.Steps10 AS minute_steps_wide10,
     msw.Steps11 AS minute_steps_wide11,
     msw.Steps12 AS minute_steps_wide12,
     msw.Steps13 AS minute_steps_wide13,
     msw.Steps14 AS minute_steps_wide14,
     msw.Steps15 AS minute_steps_wide15,
     msw.Steps16 AS minute_steps_wide16,
     msw.Steps17 AS minute_steps_wide17,
     msw.Steps18 AS minute_steps_wide18,
     msw.Steps19 AS minute_steps_wide19,
     msw.Steps20 AS minute_steps_wide20,
     msw.Steps21 AS minute_steps_wide21,
     msw.Steps22 AS minute_steps_wide22,
     msw.Steps23 AS minute_steps_wide23,
     msw.Steps24 AS minute_steps_wide24,
     msw.Steps25 AS minute_steps_wide25,
     msw.Steps26 AS minute_steps_wide26,
     msw.Steps27 AS minute_steps_wide27,
     msw.Steps28 AS minute_steps_wide28,
     msw.Steps29 AS minute_steps_wide29,
     msw.Steps30 AS minute_steps_wide30,
     msw.Steps31 AS minute_steps_wide31,
     msw.Steps32 AS minute_steps_wide32,
     msw.Steps33 AS minute_steps_wide33,
     msw.Steps34 AS minute_steps_wide34,
     msw.Steps35 AS minute_steps_wide35,
     msw.Steps36 AS minute_steps_wide36,
     msw.Steps37 AS minute_steps_wide37,
     msw.Steps38 AS minute_steps_wide38,
     msw.Steps39 AS minute_steps_wide39,
     msw.Steps40 AS minute_steps_wide40,
     msw.Steps41 AS minute_steps_wide41,
     msw.Steps42 AS minute_steps_wide42,
     msw.Steps43 AS minute_steps_wide43,
     msw.Steps44 AS minute_steps_wide44,
     msw.Steps45 AS minute_steps_wide45,
     msw.Steps46 AS minute_steps_wide46,
     msw.Steps47 AS minute_steps_wide47,
     msw.Steps48 AS minute_steps_wide48,
     msw.Steps49 AS minute_steps_wide49,
     msw.Steps50 AS minute_steps_wide50,
	 msw.Steps51 AS minute_steps_wide51,
     msw.Steps52 AS minute_steps_wide52,
     msw.Steps53 AS minute_steps_wide53,
     msw.Steps54 AS minute_steps_wide54,
     msw.Steps56 AS minute_steps_wide56,
     msw.Steps57 AS minute_steps_wide57,
     msw.Steps58 AS minute_steps_wide58,
     msw.Steps59 AS minute_steps_wide59


FROM hourlycalories as hc

-- JOIN hourly intensities
LEFT JOIN hourlyintensities as hi 
    ON hc.Id = hi.Id AND hc.ActivityHour = hi.ActivityHour

-- JOIN hourly steps
LEFT JOIN hourlysteps as hs 
    ON hc.Id = hs.Id AND hc.ActivityHour = hs.ActivityHour

-- JOIN minuteCaloriesNarrow
LEFT JOIN minutecaloriesnarrow as mcn 
    ON hc.Id = mcn.Id AND hc.ActivityHour = mcn.ActivityMinute

-- JOIN minuteCaloriesWide
LEFT JOIN minutecalorieswide as mcw 
    ON hc.Id = mcw.Id AND hc.ActivityHour = mcw.ActivityMinute

-- JOIN minuteIntensitiesNarrow
LEFT JOIN minuteintensitiesnarrow as minin 
    ON hc.Id = minin.Id AND hc.ActivityHour = minin.ActivityMinute

-- JOIN minuteIntensitiesWide
LEFT JOIN minuteintensitieswide as miniw 
    ON hc.Id = miniw.Id AND hc.ActivityHour = miniw.ActivityHour

-- JOIN minuteMETsNarrow
LEFT JOIN minutemetsnarrow as mm 
    ON hc.Id = mm.Id AND hc.ActivityHour = mm.ActivityMinute

-- JOIN minuteSleep
LEFT JOIN minutesleep as ms 
    ON hc.Id = ms.Id AND hc.ActivityHour = ms.date

-- JOIN minuteStepsNarrow
LEFT JOIN minutestepsnarrow as msn 
    ON hc.Id = msn.Id AND hc.ActivityHour = msn.ActivityMinute

-- JOIN minuteStepsWide
LEFT JOIN minutestepswide as msw 
    ON hc.Id = msw.Id AND hc.ActivityHour = msw.ActivityHour;

     
-- MERGE BOTH THE TABLES INTO SINGLE TABLE

CREATE TABLE StravaFullMergedData AS
SELECT 
    -- From daily_merged_data
    dmd.Id,
    dmd.ActivityDate,
    dmd.TotalSteps,
    dmd.TotalDistance,
    dmd.TrackerDistance,
    dmd.LoggedActivitiesDistance,
    dmd.VeryActiveDistance,
    dmd.ModeratelyActiveDistance,
    dmd.LightActiveDistance,
    dmd.SedentaryActiveDistance,
    dmd.VeryActiveMinutes,
    dmd.FairlyActiveMinutes,
    dmd.LightlyActiveMinutes,
    dmd.SedentaryMinutes,
    dmd.activity_calories,
	dmd.daily_calories,
	dmd.di_SedentaryMinutes,
    dmd.di_LightlyActiveMinutes,
    dmd.di_FairlyActiveMinutes,
    dmd.di_VeryActiveMinutes,
	dmd.di_SedentaryActiveDistance,
    dmd.di_LightActiveDistance,
    dmd.di_ModeratelyActiveDistance,
    dmd.di_VeryActiveDistance,
    dmd.ds_step_total,
    dmd.avg_heart_rate,
    dmd.TotalSleepRecords,
    dmd.TotalMinutesAsleep,
    dmd.TotalTimeInBed,
    dmd.WeightKg,
    dmd.Fat,
    dmd.BMI,

    -- From timebased_merged_data 
    tmd.TimeStamp,
    tmd.hourly_calories,
    tmd.hourly_total_intensity,
    tmd.hourly_avg_intensity,
    tmd.hourly_steps,
    tmd.minute_calories_narrow,
    tmd.minute_intensity_narrow,
    tmd.minute_mets,
    tmd.minute_sleep_value,
    tmd.minute_steps_narrow,

    -- Calories Wide Columns (00 to 59)
    tmd.calories_wide00, tmd.calories_wide01, tmd.calories_wide02, tmd.calories_wide03, tmd.calories_wide04,
    tmd.calories_wide05, tmd.calories_wide06, tmd.calories_wide07, tmd.calories_wide08, tmd.calories_wide09,
    tmd.calories_wide10, tmd.calories_wide11, tmd.calories_wide12, tmd.calories_wide13, tmd.calories_wide14,
    tmd.calories_wide15, tmd.calories_wide16, tmd.calories_wide17, tmd.calories_wide18, tmd.calories_wide19,
    tmd.calories_wide20, tmd.calories_wide21, tmd.calories_wide22, tmd.calories_wide23, tmd.calories_wide24,
    tmd.calories_wide25, tmd.calories_wide26, tmd.calories_wide27, tmd.calories_wide28, tmd.calories_wide29,
    tmd.calories_wide30, tmd.calories_wide31, tmd.calories_wide32, tmd.calories_wide33, tmd.calories_wide34,
    tmd.calories_wide35, tmd.calories_wide36, tmd.calories_wide37, tmd.calories_wide38, tmd.calories_wide39,
    tmd.calories_wide40, tmd.calories_wide41, tmd.calories_wide42, tmd.calories_wide43, tmd.calories_wide44,
    tmd.calories_wide45, tmd.calories_wide46, tmd.calories_wide47, tmd.calories_wide48, tmd.calories_wide49,
    tmd.calories_wide50, tmd.calories_wide51, tmd.calories_wide52, tmd.calories_wide53, tmd.calories_wide54,
    tmd.calories_wide55, tmd.calories_wide56, tmd.calories_wide57, tmd.calories_wide58, tmd.calories_wide59,

    -- Intensity Wide Columns (00 to 59)
    tmd.intensity_wide00, tmd.intensity_wide01, tmd.intensity_wide02, tmd.intensity_wide03, tmd.intensity_wide04,
    tmd.intensity_wide05, tmd.intensity_wide06, tmd.intensity_wide07, tmd.intensity_wide08, tmd.intensity_wide09,
    tmd.intensity_wide10, tmd.intensity_wide11, tmd.intensity_wide12, tmd.intensity_wide13, tmd.intensity_wide14,
    tmd.intensity_wide15, tmd.intensity_wide16, tmd.intensity_wide17, tmd.intensity_wide18, tmd.intensity_wide19,
    tmd.intensity_wide20, tmd.intensity_wide21, tmd.intensity_wide22, tmd.intensity_wide23, tmd.intensity_wide24,
    tmd.intensity_wide25, tmd.intensity_wide26, tmd.intensity_wide27, tmd.intensity_wide28, tmd.intensity_wide29,
    tmd.intensity_wide30, tmd.intensity_wide31, tmd.intensity_wide32, tmd.intensity_wide33, tmd.intensity_wide34,
    tmd.intensity_wide35, tmd.intensity_wide36, tmd.intensity_wide37, tmd.intensity_wide38, tmd.intensity_wide39,
    tmd.intensity_wide40, tmd.intensity_wide41, tmd.intensity_wide42, tmd.intensity_wide43, tmd.intensity_wide44,
    tmd.intensity_wide45, tmd.intensity_wide46, tmd.intensity_wide47, tmd.intensity_wide48, tmd.intensity_wide49,
    tmd.intensity_wide50, tmd.intensity_wide51, tmd.intensity_wide52, tmd.intensity_wide53, tmd.intensity_wide54,
    tmd.intensity_wide55, tmd.intensity_wide56, tmd.intensity_wide57, tmd.intensity_wide58, tmd.intensity_wide59,

    -- Steps Wide Columns (00 to 59)
    tmd.minute_steps_wide00, tmd.minute_steps_wide01, tmd.minute_steps_wide02, tmd.minute_steps_wide03, tmd.minute_steps_wide04,
    tmd.minute_steps_wide05, tmd.minute_steps_wide06, tmd.minute_steps_wide07, tmd.minute_steps_wide08, tmd.minute_steps_wide09,
    tmd.minute_steps_wide10, tmd.minute_steps_wide11, tmd.minute_steps_wide12, tmd.minute_steps_wide13, tmd.minute_steps_wide14,
    tmd.minute_steps_wide15, tmd.minute_steps_wide16, tmd.minute_steps_wide17, tmd.minute_steps_wide18, tmd.minute_steps_wide19,
    tmd.minute_steps_wide20, tmd.minute_steps_wide21, tmd.minute_steps_wide22, tmd.minute_steps_wide23, tmd.minute_steps_wide24,
    tmd.minute_steps_wide25, tmd.minute_steps_wide26, tmd.minute_steps_wide27, tmd.minute_steps_wide28, tmd.minute_steps_wide29,
    tmd.minute_steps_wide30, tmd.minute_steps_wide31, tmd.minute_steps_wide32, tmd.minute_steps_wide33, tmd.minute_steps_wide34,
    tmd.minute_steps_wide35, tmd.minute_steps_wide36, tmd.minute_steps_wide37, tmd.minute_steps_wide38, tmd.minute_steps_wide39,
    tmd.minute_steps_wide40, tmd.minute_steps_wide41, tmd.minute_steps_wide42, tmd.minute_steps_wide43, tmd.minute_steps_wide44,
    tmd.minute_steps_wide45, tmd.minute_steps_wide46, tmd.minute_steps_wide47, tmd.minute_steps_wide48, tmd.minute_steps_wide49,
    tmd.minute_steps_wide50, tmd.minute_steps_wide51, tmd.minute_steps_wide52, tmd.minute_steps_wide53, tmd.minute_steps_wide54,
    tmd.minute_steps_wide56, tmd.minute_steps_wide57, tmd.minute_steps_wide58, tmd.minute_steps_wide59

FROM 
    daily_merged_data AS dmd
LEFT JOIN 
    timebased_merged_data AS tmd
    ON dmd.Id = tmd.Id AND dmd.ActivityDate = DATE(tmd.TimeStamp);
    
    
    
-- PREPROCESSING STEPS --

-- check datatype 
 DESCRIBE stravafullmergeddata;

-- Handle missing values 

SET SQL_SAFE_UPDATES = 0;

-- avg_heart_rate
UPDATE stravafullmergeddata 
SET avg_heart_rate = (
    SELECT ROUND(AVG(avg_heart_rate), 1) 
    FROM (SELECT avg_heart_rate FROM stravafullmergeddata WHERE avg_heart_rate IS NOT NULL) AS t
)
WHERE avg_heart_rate IS NULL;

-- TotalSleepRecords
UPDATE stravafullmergeddata 
SET TotalSleepRecords = (
    SELECT ROUND(AVG(TotalSleepRecords), 1) 
    FROM (SELECT TotalSleepRecords FROM stravafullmergeddata WHERE TotalSleepRecords IS NOT NULL) AS t
)
WHERE TotalSleepRecords IS NULL;

-- TotalMinutesAsleep
UPDATE stravafullmergeddata 
SET TotalMinutesAsleep = (
    SELECT ROUND(AVG(TotalMinutesAsleep), 1) 
    FROM (SELECT TotalMinutesAsleep FROM stravafullmergeddata WHERE TotalMinutesAsleep IS NOT NULL) AS t
)
WHERE TotalMinutesAsleep IS NULL;

-- TotalTimeInBed
UPDATE stravafullmergeddata 
SET TotalTimeInBed = (
    SELECT ROUND(AVG(TotalTimeInBed), 1) 
    FROM (SELECT TotalTimeInBed FROM stravafullmergeddata WHERE TotalTimeInBed IS NOT NULL) AS t
)
WHERE TotalTimeInBed IS NULL;

-- WeightKg
UPDATE stravafullmergeddata 
SET WeightKg = (
    SELECT ROUND(AVG(WeightKg), 1) 
    FROM (SELECT WeightKg FROM stravafullmergeddata WHERE WeightKg IS NOT NULL) AS t
)
WHERE WeightKg IS NULL;

-- Fat
UPDATE stravafullmergeddata  
SET Fat = (
    SELECT ROUND(AVG(Fat), 1) 
    FROM (SELECT Fat FROM stravafullmergeddata WHERE Fat IS NOT NULL) AS t
)
WHERE Fat IS NULL AND Id IS NOT NULL;

-- BMI
UPDATE stravafullmergeddata 
SET BMI = (
    SELECT ROUND(AVG(BMI), 2)
    FROM (SELECT BMI FROM stravafullmergeddata WHERE BMI IS NOT NULL) AS t
)
WHERE BMI IS NULL;

-- minute_sleep_value
UPDATE stravafullmergeddata  
SET minute_sleep_value = (
    SELECT ROUND(AVG(minute_sleep_value)) 
    FROM (SELECT minute_sleep_value FROM stravafullmergeddata WHERE minute_sleep_value IS NOT NULL) AS t
)
WHERE minute_sleep_value IS NULL AND Id IS NOT NULL;

-- drop missing values
DELETE FROM StravaFullMergedData
WHERE calories_wide00 IS NULL;

-- check for outliners
-- BMI outside normal range
SELECT * FROM stravafullmergeddata
WHERE BMI < 10 OR BMI > 50;

-- Heart rate outliers
SELECT * FROM stravafullmergeddata
WHERE avg_heart_rate < 30 OR avg_heart_rate > 220;

-- Check for Duplicates
SELECT Id, ActivityDate, COUNT(*) AS occurrences
FROM stravafullmergeddata
GROUP BY Id, ActivityDate
HAVING COUNT(*) > 1;

-- Delete Duplicates
ALTER TABLE stravafullmergeddata 
ADD COLUMN temp_row_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

SET SQL_SAFE_UPDATES = 0;
DELETE t1
FROM stravafullmergeddata t1
JOIN stravafullmergeddata t2 
ON t1.Id = t2.Id 
   AND t1.ActivityDate = t2.ActivityDate
   AND t1.temp_row_id > t2.temp_row_id;
ALTER TABLE stravafullmergeddata DROP COLUMN temp_row_id;    
    
    


     


    
