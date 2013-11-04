USE test;
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS Event, Answer, InputState, CorrectMap, State, Account;
SET foreign_key_checks = 1;
CREATE TABLE IF NOT EXISTS Answer (
    answer_id VARCHAR(40) NOT NULL Primary Key,
    problem_id TEXT,
    answer TEXT
    );
CREATE TABLE IF NOT EXISTS CorrectMap (
    correct_map_id VARCHAR(40) NOT NULL Primary Key,
    answer_identifier TEXT,
    correctness TINYTEXT,
    npoints INT,
    msg TEXT,
    hint TEXT,
    hintmode TINYTEXT,
    queuestate TEXT
    );
CREATE TABLE IF NOT EXISTS InputState (
    input_state_id VARCHAR(40) NOT NULL Primary Key,
    problem_id TEXT,
    state TEXT
    );
CREATE TABLE IF NOT EXISTS State (
    state_id VARCHAR(40) NOT NULL Primary Key,
    seed TINYINT,
    done BOOL,
    problem_id TEXT,
    student_answer VARCHAR(40),
    correct_map VARCHAR(40),
    input_state VARCHAR(40),
    FOREIGN KEY(student_answer) REFERENCES Answer(answer_id),
    FOREIGN KEY(correct_map) REFERENCES CorrectMap(correct_map_id),
    FOREIGN KEY(input_state) REFERENCES InputState(input_state_id)
    );
CREATE TABLE IF NOT EXISTS Account (
    account_id VARCHAR(40) NOT NULL Primary Key,
    username TEXT,
    name TEXT,
    mailing_address TEXT,
    zipCode TINYTEXT,
    country TINYTEXT,
    gender TINYTEXT,
    year_of_birth TINYINT,
    level_of_education TINYTEXT,
    goals TEXT,
    honor_code BOOL,
    terms_of_service BOOL,
    course_id TEXT,
    enrollment_action TINYTEXT,
    email TEXT,
    receive_emails TINYTEXT
    );
CREATE TABLE IF NOT EXISTS Event (
    eventID VARCHAR(40),
    agent TEXT,
    event_source TINYTEXT,
    event_type TEXT,
    ip TINYTEXT,
    page TEXT,
    session TEXT,
    time DATETIME,
    username TEXT,
    downtime_for DATETIME,
    studentID TEXT,
    instructorID TEXT,
    courseID TEXT,
    seqID TEXT,
    gotoFrom INT,
    gotoDest INT,
    problemID TEXT,
    problemChoice TEXT,
    questionLocation TEXT,
    submissionID TEXT,
    attempts TINYINT,
    longAnswer TEXT,
    studentFile TEXT,
    canUploadFile TINYTEXT,
    feedback TEXT,
    feedbackResponseSelected TINYINT,
    transcriptID TEXT,
    transcriptCode TINYTEXT,
    rubricSelection INT,
    rubricCategory INT,
    videoID TEXT,
    videoCode TEXT,
    videoCurrentTime TINYTEXT,
    videoSpeed TINYTEXT,
    videoOldTime TINYTEXT,
    videoNewTime TINYTEXT,
    videoSeekType TINYTEXT,
    videoNewSpeed TINYTEXT,
    videoOldSpeed TINYTEXT,
    bookInteractionType TINYTEXT,
    success TINYTEXT,
    answer_id TEXT,
    hint TEXT,
    hintmode TINYTEXT,
    correctness TINYTEXT,
    msg TEXT,
    npoints TINYINT,
    queuestate TEXT,
    orig_score INT,
    new_score INT,
    orig_total INT,
    new_total INT,
    event_name TINYTEXT,
    group_user TINYTEXT,
    group_action TINYTEXT,
    position INT,
    badlyFormatted TEXT,
    correctMapFK VARCHAR(40),
    answerFK VARCHAR(40),
    stateFK VARCHAR(40),
    accountFK VARCHAR(40),
    FOREIGN KEY(correctMapFK) REFERENCES CorrectMap(correct_map_id),
    FOREIGN KEY(answerFK) REFERENCES Answer(answer_id),
    FOREIGN KEY(stateFK) REFERENCES State(state_id),
    FOREIGN KEY(accountFK) REFERENCES Account(account_id)
    );
SET foreign_key_checks=0;
SET unique_checks=0;
SET autocommit=0;
INSERT INTO Answer (answer_id,problem_id,answer) VALUES 
    ('817bfc2b_0baa_40cc_99f9_f53d0db44c08','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_16_1','66.3'),
    ('5b8c60c1_4ccf_43df_ba1e_ea04b2f524d8','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_3_1','1.58'),
    ('e91d2390_c1eb_496f_b641_72dcdf2983ca','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_12_1','Binary'),
    ('064000d2_8619_4421_baef_c4a4cd29f1b9','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_6_1','choice_2'),
    ('33eeaa26_ec05_4d4b_bf06_6d7943bcdb86','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_17_1','73.9'),
    ('a1786c55_b5f9_40a0_ac8e_33496d776879','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_2_1','13.4'),
    ('54d7944c_42ea_45c2_a05d_6b56dc54e8a1','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_9_1','53'),
    ('de335404_208f_4fc7_be33_e440ccc1c2a9','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_14_1','choice_3'),
    ('43982e56_fcbf_4fa0_a8d2_ed3797085d78','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_13_1','choice_0'),
    ('9866c669_2f6f_4bfb_9379_865d94b2a440','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_5_1','3'),
    ('7cccc38c_fd70_4c01_a22e_76e955afded2','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_10_1','1'),
    ('5bca9dbd_ee79_4cd3_91fd_1daf905fe71f','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_19_1','choice_2'),
    ('a435205e_b34c_438e_8d57_9e8b8b026ad5','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_8_1','0.25'),
    ('7a4645bd_63d2_4e88_882f_b429f8f634fb','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_15_1','81'),
    ('444bb02b_de8f_470d_9475_82e7eaa1097b','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_4_1','14'),
    ('ff18811e_2ee4_4d56_9f99_6072c897fe9e','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_11_1','Nominal'),
    ('c2cc6e21_7fa3_454c_9ac7_2f9132368fd6','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_18_1','20'),
    ('00dfd556_ecff_430a_9ac0_14796a918b61','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_7_1','0.47'),
    ('151a9974_f36f_4fe5_9cf5_0f7ad5f7db2f','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_16_1','66.3'),
    ('60e26974_09f7_43a1_91fb_e575f8737de8','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_3_1','1.58'),
    ('ba116223_fbaa_4830_a80a_6a690f0aa45a','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_12_1','Binary'),
    ('c8e99cb6_c44e_48ba_b0db_ba18f39e00f5','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_6_1','choice_2'),
    ('a5135d73_629a_4c34_bba0_65f9b5ffd0d0','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_17_1','73.9'),
    ('adf1bd91_6ad3_4005_af98_8f2252a9919f','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_2_1','13.4'),
    ('549772c6_c881_4a94_9fa6_ec02258c3f28','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_9_1','53'),
    ('80118e39_f4f4_4345_9671_8fd9b3acda15','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_14_1','choice_3'),
    ('32c13c81_6f93_4cf2_806f_960a5b12bce7','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_13_1','choice_0'),
    ('bc035b03_7b0d_41ef_94da_c852df213df3','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_5_1','3'),
    ('c0d82d3d_bf40_48e3_b750_cd2a9b195a34','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_10_1','1'),
    ('448d86e1_896e_4cfb_9d38_80878d550ef9','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_19_1','choice_2'),
    ('057fdebd_7388_4457_b03f_705febe28124','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_8_1','0.25'),
    ('217c3c91_7e2d_4fe4_ac48_b92c19842d68','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_15_1','81'),
    ('e5450dfd_4d04_4130_82fa_9379590dfa97','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_4_1','14'),
    ('5ece04bd_7065_41e5_bb5b_54bf0d36dc24','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_11_1','Nominal'),
    ('b286e7d3_e3d5_4335_85b6_b77770733129','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_18_1','20'),
    ('ea55866e_b829_461b_afe3_41421c16c788','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_7_1','0.47');
INSERT INTO InputState (input_state_id,problem_id,state) VALUES 
    ('bd617578_5506_4fed_b4da_b57795e9d1cf','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_16_1',null),
    ('b3af024c_9de9_4665_970c_a507f78fcdbb','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_3_1',null),
    ('96049b13_6641_455d_a2b5_8153e5ac188d','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_12_1',null),
    ('bbd917ca_116c_4e8b_85ec_ae90c07d4f22','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_6_1',null),
    ('ee547580_d240_417c_8e51_4d96b2bd35eb','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_17_1',null),
    ('1f357027_1a74_4f05_8124_caab709ae3cc','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_2_1',null),
    ('768235c4_7b1b_462e_9b88_33fc9b88d4b0','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_9_1',null),
    ('bb6d3d16_5c50_4ddd_9d96_3c7343321aee','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_14_1',null),
    ('b096a0f0_6a95_4a1e_a656_b54d087dc439','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_13_1',null),
    ('c64c916d_5455_4c34_bf05_123539faa0f2','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_5_1',null),
    ('3f80358f_5087_4e25_ac4d_c5fe058e8a76','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_10_1',null),
    ('92b9bf6b_a40e_45be_83c0_f4178d3f6f81','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_19_1',null),
    ('fa1123a7_509f_46a2_8cf6_eeb80ab73602','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_8_1',null),
    ('bb1ff533_d179_4a88_91a1_9a883dd4eefe','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_15_1',null),
    ('e5ca6325_ac6a_486b_bda9_f34c305dfc6e','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_4_1',null),
    ('dd924bc8_6479_4ca9_9d2c_e99d7eca09b1','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_11_1',null),
    ('8271689c_35e1_4bb0_b6a7_6d78d6f35563','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_18_1',null),
    ('fb436e82_f3f3_41e8_ba8e_2b1d4d2bbec3','i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_7_1',null);
INSERT INTO State (state_id,seed,done,problem_id,student_answer,correct_map,input_state) VALUES 
    ('5bef004a_b65a_4fd7_acb6_e67c4808319b',1,null,null,'151a9974_f36f_4fe5_9cf5_0f7ad5f7db2f',null,'bd617578_5506_4fed_b4da_b57795e9d1cf'),
    ('f37c37bf_8ece_4aa4_bf75_caf995cc34d0',1,null,null,'60e26974_09f7_43a1_91fb_e575f8737de8',null,'b3af024c_9de9_4665_970c_a507f78fcdbb'),
    ('62c411da_08c9_4d00_8ecf_836a5d1984e6',1,null,null,'ba116223_fbaa_4830_a80a_6a690f0aa45a',null,'96049b13_6641_455d_a2b5_8153e5ac188d'),
    ('5c25427d_a8eb_4f82_a44a_6759091eb3bd',1,null,null,'c8e99cb6_c44e_48ba_b0db_ba18f39e00f5',null,'bbd917ca_116c_4e8b_85ec_ae90c07d4f22'),
    ('1192da0a_825d_472f_aff4_83cbe86b6cb2',1,null,null,'a5135d73_629a_4c34_bba0_65f9b5ffd0d0',null,'ee547580_d240_417c_8e51_4d96b2bd35eb'),
    ('70da103d_04fa_4350_8f09_bb43779b426c',1,null,null,'adf1bd91_6ad3_4005_af98_8f2252a9919f',null,'1f357027_1a74_4f05_8124_caab709ae3cc'),
    ('68414c94_ab9a_4b5c_bde5_8c5d4213d5d2',1,null,null,'549772c6_c881_4a94_9fa6_ec02258c3f28',null,'768235c4_7b1b_462e_9b88_33fc9b88d4b0'),
    ('b6de1193_92ae_467a_820e_c64047dfad0c',1,null,null,'80118e39_f4f4_4345_9671_8fd9b3acda15',null,'bb6d3d16_5c50_4ddd_9d96_3c7343321aee'),
    ('20e9d05a_814e_40c4_897a_1e8b23c69013',1,null,null,'32c13c81_6f93_4cf2_806f_960a5b12bce7',null,'b096a0f0_6a95_4a1e_a656_b54d087dc439'),
    ('9b3c34ad_eefb_4084_828d_ce6829960dd1',1,null,null,'bc035b03_7b0d_41ef_94da_c852df213df3',null,'c64c916d_5455_4c34_bf05_123539faa0f2'),
    ('57ad1b53_c3d8_423c_bb07_94e3c29584ab',1,null,null,'c0d82d3d_bf40_48e3_b750_cd2a9b195a34',null,'3f80358f_5087_4e25_ac4d_c5fe058e8a76'),
    ('529cf98c_5e92_4c20_8246_660bda01a44f',1,null,null,'448d86e1_896e_4cfb_9d38_80878d550ef9',null,'92b9bf6b_a40e_45be_83c0_f4178d3f6f81'),
    ('7a27f5cb_6d85_412f_bd29_8042a2a9d160',1,null,null,'057fdebd_7388_4457_b03f_705febe28124',null,'fa1123a7_509f_46a2_8cf6_eeb80ab73602'),
    ('3ab189a8_a4fd_4489_b269_7869dcccaf8f',1,null,null,'217c3c91_7e2d_4fe4_ac48_b92c19842d68',null,'bb1ff533_d179_4a88_91a1_9a883dd4eefe'),
    ('62d3ed23_c0aa_43e3_acc0_96f7161fcfd6',1,null,null,'e5450dfd_4d04_4130_82fa_9379590dfa97',null,'e5ca6325_ac6a_486b_bda9_f34c305dfc6e'),
    ('1a3384f1_64d9_4ae0_9188_df8ef44961d6',1,null,null,'5ece04bd_7065_41e5_bb5b_54bf0d36dc24',null,'dd924bc8_6479_4ca9_9d2c_e99d7eca09b1'),
    ('2bb634d2_7a53_4f78_83a9_64ec8dc94600',1,null,null,'b286e7d3_e3d5_4335_85b6_b77770733129',null,'8271689c_35e1_4bb0_b6a7_6d78d6f35563'),
    ('bfe9de2e_9792_4a41_8b2c_c9db35a5ac02',1,null,null,'ea55866e_b829_461b_afe3_41421c16c788',null,'fb436e82_f3f3_41e8_ba8e_2b1d4d2bbec3');
INSERT INTO Event (eventID,agent,event_source,event_type,ip,page,session,time,username,downtime_for,studentID,instructorID,courseID,seqID,gotoFrom,gotoDest,problemID,problemChoice,questionLocation,submissionID,attempts,longAnswer,studentFile,canUploadFile,feedback,feedbackResponseSelected,transcriptID,transcriptCode,rubricSelection,rubricCategory,videoID,videoCode,videoCurrentTime,videoSpeed,videoOldTime,videoNewTime,videoSeekType,videoNewSpeed,videoOldSpeed,bookInteractionType,success,answer_id,hint,hintmode,correctness,msg,npoints,queuestate,orig_score,new_score,orig_total,new_total,event_name,group_user,group_action,position,badlyFormatted,correctMapFK,answerFK,stateFK) VALUES 
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_16_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'817bfc2b_0baa_40cc_99f9_f53d0db44c08','5bef004a_b65a_4fd7_acb6_e67c4808319b'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_3_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'5b8c60c1_4ccf_43df_ba1e_ea04b2f524d8','f37c37bf_8ece_4aa4_bf75_caf995cc34d0'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_12_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'e91d2390_c1eb_496f_b641_72dcdf2983ca','62c411da_08c9_4d00_8ecf_836a5d1984e6'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_6_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'064000d2_8619_4421_baef_c4a4cd29f1b9','5c25427d_a8eb_4f82_a44a_6759091eb3bd'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_17_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'33eeaa26_ec05_4d4b_bf06_6d7943bcdb86','1192da0a_825d_472f_aff4_83cbe86b6cb2'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_2_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'a1786c55_b5f9_40a0_ac8e_33496d776879','70da103d_04fa_4350_8f09_bb43779b426c'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_9_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'54d7944c_42ea_45c2_a05d_6b56dc54e8a1','68414c94_ab9a_4b5c_bde5_8c5d4213d5d2'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_14_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'de335404_208f_4fc7_be33_e440ccc1c2a9','b6de1193_92ae_467a_820e_c64047dfad0c'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_13_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'43982e56_fcbf_4fa0_a8d2_ed3797085d78','20e9d05a_814e_40c4_897a_1e8b23c69013'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_5_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'9866c669_2f6f_4bfb_9379_865d94b2a440','9b3c34ad_eefb_4084_828d_ce6829960dd1'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_10_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'7cccc38c_fd70_4c01_a22e_76e955afded2','57ad1b53_c3d8_423c_bb07_94e3c29584ab'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_19_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'5bca9dbd_ee79_4cd3_91fd_1daf905fe71f','529cf98c_5e92_4c20_8246_660bda01a44f'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_8_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'a435205e_b34c_438e_8d57_9e8b8b026ad5','7a27f5cb_6d85_412f_bd29_8042a2a9d160'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_15_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'7a4645bd_63d2_4e88_882f_b429f8f634fb','3ab189a8_a4fd_4489_b269_7869dcccaf8f'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_4_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'444bb02b_de8f_470d_9475_82e7eaa1097b','62d3ed23_c0aa_43e3_acc0_96f7161fcfd6'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_11_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'ff18811e_2ee4_4d56_9f99_6072c897fe9e','1a3384f1_64d9_4ae0_9188_df8ef44961d6'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_18_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'c2cc6e21_7fa3_454c_9ac7_2f9132368fd6','2bb634d2_7a53_4f78_83a9_64ec8dc94600'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_7_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'00dfd556_ecff_430a_9ac0_14796a918b61','bfe9de2e_9792_4a41_8b2c_c9db35a5ac02'),
    ('daf8b796_1642_4dab_9d72_fba926c293f9','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36','server','save_problem_check','147.32.84.59','x_module',null,'2013-06-12T09:19:41.439185','Radim','0:00:00',null,null,null,null,null,null,'i4x-Medicine-HRP258-problem-44c1ef4e92f648b08adbdcd61d64d558_7_1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'incorrect',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'00dfd556_ecff_430a_9ac0_14796a918b61','bfe9de2e_9792_4a41_8b2c_c9db35a5ac02');
COMMIT;
SET foreign_key_checks=1;
SET unique_checks=1;
