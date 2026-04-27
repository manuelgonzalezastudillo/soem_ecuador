%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'SOE_Estimation';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('SOE_Estimation.log');
M_.exo_names = cell(27,1);
M_.exo_names_tex = cell(27,1);
M_.exo_names_long = cell(27,1);
M_.exo_names(1) = {'eps_v'};
M_.exo_names_tex(1) = {'eps\_v'};
M_.exo_names_long(1) = {'eps_v'};
M_.exo_names(2) = {'eps_kappa'};
M_.exo_names_tex(2) = {'eps\_kappa'};
M_.exo_names_long(2) = {'eps_kappa'};
M_.exo_names(3) = {'eps_u'};
M_.exo_names_tex(3) = {'eps\_u'};
M_.exo_names_long(3) = {'eps_u'};
M_.exo_names(4) = {'eps_z'};
M_.exo_names_tex(4) = {'eps\_z'};
M_.exo_names_long(4) = {'eps_z'};
M_.exo_names(5) = {'eps_a'};
M_.exo_names_tex(5) = {'eps\_a'};
M_.exo_names_long(5) = {'eps_a'};
M_.exo_names(6) = {'eps_zeta'};
M_.exo_names_tex(6) = {'eps\_zeta'};
M_.exo_names_long(6) = {'eps_zeta'};
M_.exo_names(7) = {'eps_yCo'};
M_.exo_names_tex(7) = {'eps\_yCo'};
M_.exo_names_long(7) = {'eps_yCo'};
M_.exo_names(8) = {'eps_Rstar'};
M_.exo_names_tex(8) = {'eps\_Rstar'};
M_.exo_names_long(8) = {'eps_Rstar'};
M_.exo_names(9) = {'eps_pCostar'};
M_.exo_names_tex(9) = {'eps\_pCostar'};
M_.exo_names_long(9) = {'eps_pCostar'};
M_.exo_names(10) = {'eps_y_star'};
M_.exo_names_tex(10) = {'eps\_y\_star'};
M_.exo_names_long(10) = {'eps_y_star'};
M_.exo_names(11) = {'eps_g_c'};
M_.exo_names_tex(11) = {'eps\_g\_c'};
M_.exo_names_long(11) = {'eps_g_c'};
M_.exo_names(12) = {'eps_g_i'};
M_.exo_names_tex(12) = {'eps\_g\_i'};
M_.exo_names_long(12) = {'eps_g_i'};
M_.exo_names(13) = {'eps_TR'};
M_.exo_names_tex(13) = {'eps\_TR'};
M_.exo_names_long(13) = {'eps_TR'};
M_.exo_names(14) = {'eps_gam_YNCo_obs'};
M_.exo_names_tex(14) = {'eps\_gam\_YNCo\_obs'};
M_.exo_names_long(14) = {'eps_gam_YNCo_obs'};
M_.exo_names(15) = {'eps_gam_C_obs'};
M_.exo_names_tex(15) = {'eps\_gam\_C\_obs'};
M_.exo_names_long(15) = {'eps_gam_C_obs'};
M_.exo_names(16) = {'eps_gam_I_obs'};
M_.exo_names_tex(16) = {'eps\_gam\_I\_obs'};
M_.exo_names_long(16) = {'eps_gam_I_obs'};
M_.exo_names(17) = {'eps_xi_obs'};
M_.exo_names_tex(17) = {'eps\_xi\_obs'};
M_.exo_names_long(17) = {'eps_xi_obs'};
M_.exo_names(18) = {'eps_pCostar_obs'};
M_.exo_names_tex(18) = {'eps\_pCostar\_obs'};
M_.exo_names_long(18) = {'eps_pCostar_obs'};
M_.exo_names(19) = {'eps_YCo_obs'};
M_.exo_names_tex(19) = {'eps\_YCo\_obs'};
M_.exo_names_long(19) = {'eps_YCo_obs'};
M_.exo_names(20) = {'eps_gam_G_obs'};
M_.exo_names_tex(20) = {'eps\_gam\_G\_obs'};
M_.exo_names_long(20) = {'eps_gam_G_obs'};
M_.exo_names(21) = {'eps_Rstar_obs'};
M_.exo_names_tex(21) = {'eps\_Rstar\_obs'};
M_.exo_names_long(21) = {'eps_Rstar_obs'};
M_.exo_names(22) = {'eps_Ystar_obs'};
M_.exo_names_tex(22) = {'eps\_Ystar\_obs'};
M_.exo_names_long(22) = {'eps_Ystar_obs'};
M_.exo_names(23) = {'eps_gam_Ig_obs'};
M_.exo_names_tex(23) = {'eps\_gam\_Ig\_obs'};
M_.exo_names_long(23) = {'eps_gam_Ig_obs'};
M_.exo_names(24) = {'eps_gam_TR_obs'};
M_.exo_names_tex(24) = {'eps\_gam\_TR\_obs'};
M_.exo_names_long(24) = {'eps_gam_TR_obs'};
M_.exo_names(25) = {'eps_ratio_TBY_obs'};
M_.exo_names_tex(25) = {'eps\_ratio\_TBY\_obs'};
M_.exo_names_long(25) = {'eps_ratio_TBY_obs'};
M_.exo_names(26) = {'eps_hours_obs'};
M_.exo_names_tex(26) = {'eps\_hours\_obs'};
M_.exo_names_long(26) = {'eps_hours_obs'};
M_.exo_names(27) = {'eps_gama_YNCo_obs'};
M_.exo_names_tex(27) = {'eps\_gama\_YNCo\_obs'};
M_.exo_names_long(27) = {'eps_gama_YNCo_obs'};
M_.endo_names = cell(89,1);
M_.endo_names_tex = cell(89,1);
M_.endo_names_long = cell(89,1);
M_.endo_names(1) = {'lam_o'};
M_.endo_names_tex(1) = {'lam\_o'};
M_.endo_names_long(1) = {'lam_o'};
M_.endo_names(2) = {'c_hat_o'};
M_.endo_names_tex(2) = {'c\_hat\_o'};
M_.endo_names_long(2) = {'c_hat_o'};
M_.endo_names(3) = {'c_o'};
M_.endo_names_tex(3) = {'c\_o'};
M_.endo_names_long(3) = {'c_o'};
M_.endo_names(4) = {'h_o'};
M_.endo_names_tex(4) = {'h\_o'};
M_.endo_names_long(4) = {'h_o'};
M_.endo_names(5) = {'i_o'};
M_.endo_names_tex(5) = {'i\_o'};
M_.endo_names_long(5) = {'i_o'};
M_.endo_names(6) = {'k_o'};
M_.endo_names_tex(6) = {'k\_o'};
M_.endo_names_long(6) = {'k_o'};
M_.endo_names(7) = {'f_star_o'};
M_.endo_names_tex(7) = {'f\_star\_o'};
M_.endo_names_long(7) = {'f_star_o'};
M_.endo_names(8) = {'Theta_o'};
M_.endo_names_tex(8) = {'Theta\_o'};
M_.endo_names_long(8) = {'Theta_o'};
M_.endo_names(9) = {'chitil_o'};
M_.endo_names_tex(9) = {'chitil\_o'};
M_.endo_names_long(9) = {'chitil_o'};
M_.endo_names(10) = {'lam_r'};
M_.endo_names_tex(10) = {'lam\_r'};
M_.endo_names_long(10) = {'lam_r'};
M_.endo_names(11) = {'c_hat_r'};
M_.endo_names_tex(11) = {'c\_hat\_r'};
M_.endo_names_long(11) = {'c_hat_r'};
M_.endo_names(12) = {'c_r'};
M_.endo_names_tex(12) = {'c\_r'};
M_.endo_names_long(12) = {'c_r'};
M_.endo_names(13) = {'h_r'};
M_.endo_names_tex(13) = {'h\_r'};
M_.endo_names_long(13) = {'h_r'};
M_.endo_names(14) = {'Theta_r'};
M_.endo_names_tex(14) = {'Theta\_r'};
M_.endo_names_long(14) = {'Theta_r'};
M_.endo_names(15) = {'chitil_r'};
M_.endo_names_tex(15) = {'chitil\_r'};
M_.endo_names_long(15) = {'chitil_r'};
M_.endo_names(16) = {'c'};
M_.endo_names_tex(16) = {'c'};
M_.endo_names_long(16) = {'c'};
M_.endo_names(17) = {'h'};
M_.endo_names_tex(17) = {'h'};
M_.endo_names_long(17) = {'h'};
M_.endo_names(18) = {'i'};
M_.endo_names_tex(18) = {'i'};
M_.endo_names_long(18) = {'i'};
M_.endo_names(19) = {'k'};
M_.endo_names_tex(19) = {'k'};
M_.endo_names_long(19) = {'k'};
M_.endo_names(20) = {'f_star'};
M_.endo_names_tex(20) = {'f\_star'};
M_.endo_names_long(20) = {'f_star'};
M_.endo_names(21) = {'q'};
M_.endo_names_tex(21) = {'q'};
M_.endo_names_long(21) = {'q'};
M_.endo_names(22) = {'w'};
M_.endo_names_tex(22) = {'w'};
M_.endo_names_long(22) = {'w'};
M_.endo_names(23) = {'rK'};
M_.endo_names_tex(23) = {'rK'};
M_.endo_names_long(23) = {'rK'};
M_.endo_names(24) = {'y'};
M_.endo_names_tex(24) = {'y'};
M_.endo_names_long(24) = {'y'};
M_.endo_names(25) = {'yC'};
M_.endo_names_tex(25) = {'yC'};
M_.endo_names_long(25) = {'yC'};
M_.endo_names(26) = {'yF'};
M_.endo_names_tex(26) = {'yF'};
M_.endo_names_long(26) = {'yF'};
M_.endo_names(27) = {'yH'};
M_.endo_names_tex(27) = {'yH'};
M_.endo_names_long(27) = {'yH'};
M_.endo_names(28) = {'xF'};
M_.endo_names_tex(28) = {'xF'};
M_.endo_names_long(28) = {'xF'};
M_.endo_names(29) = {'xH'};
M_.endo_names_tex(29) = {'xH'};
M_.endo_names_long(29) = {'xH'};
M_.endo_names(30) = {'xHstar'};
M_.endo_names_tex(30) = {'xHstar'};
M_.endo_names_long(30) = {'xHstar'};
M_.endo_names(31) = {'pi'};
M_.endo_names_tex(31) = {'pi'};
M_.endo_names_long(31) = {'pi'};
M_.endo_names(32) = {'pH'};
M_.endo_names_tex(32) = {'pH'};
M_.endo_names_long(32) = {'pH'};
M_.endo_names(33) = {'p'};
M_.endo_names_tex(33) = {'p'};
M_.endo_names_long(33) = {'p'};
M_.endo_names(34) = {'tb'};
M_.endo_names_tex(34) = {'tb'};
M_.endo_names_long(34) = {'tb'};
M_.endo_names(35) = {'xi'};
M_.endo_names_tex(35) = {'xi'};
M_.endo_names_long(35) = {'xi'};
M_.endo_names(36) = {'tau_k'};
M_.endo_names_tex(36) = {'tau\_k'};
M_.endo_names_long(36) = {'tau_k'};
M_.endo_names(37) = {'tau_n'};
M_.endo_names_tex(37) = {'tau\_n'};
M_.endo_names_long(37) = {'tau_n'};
M_.endo_names(38) = {'tau_c'};
M_.endo_names_tex(38) = {'tau\_c'};
M_.endo_names_long(38) = {'tau_c'};
M_.endo_names(39) = {'k_g'};
M_.endo_names_tex(39) = {'k\_g'};
M_.endo_names_long(39) = {'k_g'};
M_.endo_names(40) = {'g_c'};
M_.endo_names_tex(40) = {'g\_c'};
M_.endo_names_long(40) = {'g_c'};
M_.endo_names(41) = {'g_i'};
M_.endo_names_tex(41) = {'g\_i'};
M_.endo_names_long(41) = {'g_i'};
M_.endo_names(42) = {'tr'};
M_.endo_names_tex(42) = {'tr'};
M_.endo_names_long(42) = {'tr'};
M_.endo_names(43) = {'tr_o'};
M_.endo_names_tex(43) = {'tr\_o'};
M_.endo_names_long(43) = {'tr_o'};
M_.endo_names(44) = {'tr_r'};
M_.endo_names_tex(44) = {'tr\_r'};
M_.endo_names_long(44) = {'tr_r'};
M_.endo_names(45) = {'b_star'};
M_.endo_names_tex(45) = {'b\_star'};
M_.endo_names_long(45) = {'b_star'};
M_.endo_names(46) = {'gdp_nco'};
M_.endo_names_tex(46) = {'gdp\_nco'};
M_.endo_names_long(46) = {'gdp_nco'};
M_.endo_names(47) = {'v'};
M_.endo_names_tex(47) = {'v'};
M_.endo_names_long(47) = {'v'};
M_.endo_names(48) = {'kappa_o'};
M_.endo_names_tex(48) = {'kappa\_o'};
M_.endo_names_long(48) = {'kappa_o'};
M_.endo_names(49) = {'kappa_r'};
M_.endo_names_tex(49) = {'kappa\_r'};
M_.endo_names_long(49) = {'kappa_r'};
M_.endo_names(50) = {'u'};
M_.endo_names_tex(50) = {'u'};
M_.endo_names_long(50) = {'u'};
M_.endo_names(51) = {'z'};
M_.endo_names_tex(51) = {'z'};
M_.endo_names_long(51) = {'z'};
M_.endo_names(52) = {'a'};
M_.endo_names_tex(52) = {'a'};
M_.endo_names_long(52) = {'a'};
M_.endo_names(53) = {'zeta'};
M_.endo_names_tex(53) = {'zeta'};
M_.endo_names_long(53) = {'zeta'};
M_.endo_names(54) = {'yCo'};
M_.endo_names_tex(54) = {'yCo'};
M_.endo_names_long(54) = {'yCo'};
M_.endo_names(55) = {'pCostar'};
M_.endo_names_tex(55) = {'pCostar'};
M_.endo_names_long(55) = {'pCostar'};
M_.endo_names(56) = {'Rstar'};
M_.endo_names_tex(56) = {'Rstar'};
M_.endo_names_long(56) = {'Rstar'};
M_.endo_names(57) = {'y_star'};
M_.endo_names_tex(57) = {'y\_star'};
M_.endo_names_long(57) = {'y_star'};
M_.endo_names(58) = {'yNCo'};
M_.endo_names_tex(58) = {'yNCo'};
M_.endo_names_long(58) = {'yNCo'};
M_.endo_names(59) = {'gam_YNCo'};
M_.endo_names_tex(59) = {'gam\_YNCo'};
M_.endo_names_long(59) = {'gam_YNCo'};
M_.endo_names(60) = {'gama_YNCo'};
M_.endo_names_tex(60) = {'gama\_YNCo'};
M_.endo_names_long(60) = {'gama_YNCo'};
M_.endo_names(61) = {'gam_C'};
M_.endo_names_tex(61) = {'gam\_C'};
M_.endo_names_long(61) = {'gam_C'};
M_.endo_names(62) = {'gam_I'};
M_.endo_names_tex(62) = {'gam\_I'};
M_.endo_names_long(62) = {'gam_I'};
M_.endo_names(63) = {'gam_G'};
M_.endo_names_tex(63) = {'gam\_G'};
M_.endo_names_long(63) = {'gam_G'};
M_.endo_names(64) = {'gam_Ig'};
M_.endo_names_tex(64) = {'gam\_Ig'};
M_.endo_names_long(64) = {'gam_Ig'};
M_.endo_names(65) = {'ratio_BY'};
M_.endo_names_tex(65) = {'ratio\_BY'};
M_.endo_names_long(65) = {'ratio_BY'};
M_.endo_names(66) = {'ratio_TBY'};
M_.endo_names_tex(66) = {'ratio\_TBY'};
M_.endo_names_long(66) = {'ratio_TBY'};
M_.endo_names(67) = {'rer'};
M_.endo_names_tex(67) = {'rer'};
M_.endo_names_long(67) = {'rer'};
M_.endo_names(68) = {'gam_TR'};
M_.endo_names_tex(68) = {'gam\_TR'};
M_.endo_names_long(68) = {'gam_TR'};
M_.endo_names(69) = {'ratio_FY'};
M_.endo_names_tex(69) = {'ratio\_FY'};
M_.endo_names_long(69) = {'ratio_FY'};
M_.endo_names(70) = {'gam_YNCo_obs'};
M_.endo_names_tex(70) = {'gam\_YNCo\_obs'};
M_.endo_names_long(70) = {'gam_YNCo_obs'};
M_.endo_names(71) = {'gama_YNCo_obs'};
M_.endo_names_tex(71) = {'gama\_YNCo\_obs'};
M_.endo_names_long(71) = {'gama_YNCo_obs'};
M_.endo_names(72) = {'gam_C_obs'};
M_.endo_names_tex(72) = {'gam\_C\_obs'};
M_.endo_names_long(72) = {'gam_C_obs'};
M_.endo_names(73) = {'gam_I_obs'};
M_.endo_names_tex(73) = {'gam\_I\_obs'};
M_.endo_names_long(73) = {'gam_I_obs'};
M_.endo_names(74) = {'xi_obs'};
M_.endo_names_tex(74) = {'xi\_obs'};
M_.endo_names_long(74) = {'xi_obs'};
M_.endo_names(75) = {'pCostar_obs'};
M_.endo_names_tex(75) = {'pCostar\_obs'};
M_.endo_names_long(75) = {'pCostar_obs'};
M_.endo_names(76) = {'YCo_obs'};
M_.endo_names_tex(76) = {'YCo\_obs'};
M_.endo_names_long(76) = {'YCo_obs'};
M_.endo_names(77) = {'gam_G_obs'};
M_.endo_names_tex(77) = {'gam\_G\_obs'};
M_.endo_names_long(77) = {'gam_G_obs'};
M_.endo_names(78) = {'Rstar_obs'};
M_.endo_names_tex(78) = {'Rstar\_obs'};
M_.endo_names_long(78) = {'Rstar_obs'};
M_.endo_names(79) = {'Ystar_obs'};
M_.endo_names_tex(79) = {'Ystar\_obs'};
M_.endo_names_long(79) = {'Ystar_obs'};
M_.endo_names(80) = {'gam_Ig_obs'};
M_.endo_names_tex(80) = {'gam\_Ig\_obs'};
M_.endo_names_long(80) = {'gam_Ig_obs'};
M_.endo_names(81) = {'gam_TR_obs'};
M_.endo_names_tex(81) = {'gam\_TR\_obs'};
M_.endo_names_long(81) = {'gam_TR_obs'};
M_.endo_names(82) = {'ratio_TBY_obs'};
M_.endo_names_tex(82) = {'ratio\_TBY\_obs'};
M_.endo_names_long(82) = {'ratio_TBY_obs'};
M_.endo_names(83) = {'hours_obs'};
M_.endo_names_tex(83) = {'hours\_obs'};
M_.endo_names_long(83) = {'hours_obs'};
M_.endo_names(84) = {'AUX_ENDO_LAG_57_1'};
M_.endo_names_tex(84) = {'AUX\_ENDO\_LAG\_57\_1'};
M_.endo_names_long(84) = {'AUX_ENDO_LAG_57_1'};
M_.endo_names(85) = {'AUX_ENDO_LAG_57_2'};
M_.endo_names_tex(85) = {'AUX\_ENDO\_LAG\_57\_2'};
M_.endo_names_long(85) = {'AUX_ENDO_LAG_57_2'};
M_.endo_names(86) = {'AUX_ENDO_LAG_57_3'};
M_.endo_names_tex(86) = {'AUX\_ENDO\_LAG\_57\_3'};
M_.endo_names_long(86) = {'AUX_ENDO_LAG_57_3'};
M_.endo_names(87) = {'AUX_ENDO_LAG_51_1'};
M_.endo_names_tex(87) = {'AUX\_ENDO\_LAG\_51\_1'};
M_.endo_names_long(87) = {'AUX_ENDO_LAG_51_1'};
M_.endo_names(88) = {'AUX_ENDO_LAG_51_2'};
M_.endo_names_tex(88) = {'AUX\_ENDO\_LAG\_51\_2'};
M_.endo_names_long(88) = {'AUX_ENDO_LAG_51_2'};
M_.endo_names(89) = {'AUX_ENDO_LAG_51_3'};
M_.endo_names_tex(89) = {'AUX\_ENDO\_LAG\_51\_3'};
M_.endo_names_long(89) = {'AUX_ENDO_LAG_51_3'};
M_.endo_partitions = struct();
M_.param_names = cell(88,1);
M_.param_names_tex = cell(88,1);
M_.param_names_long = cell(88,1);
M_.param_names(1) = {'varsigma'};
M_.param_names_tex(1) = {'varsigma'};
M_.param_names_long(1) = {'varsigma'};
M_.param_names(2) = {'hpsi'};
M_.param_names_tex(2) = {'hpsi'};
M_.param_names_long(2) = {'hpsi'};
M_.param_names(3) = {'sigma'};
M_.param_names_tex(3) = {'sigma'};
M_.param_names_long(3) = {'sigma'};
M_.param_names(4) = {'phi'};
M_.param_names_tex(4) = {'phi'};
M_.param_names_long(4) = {'phi'};
M_.param_names(5) = {'alpha'};
M_.param_names_tex(5) = {'alpha'};
M_.param_names_long(5) = {'alpha'};
M_.param_names(6) = {'delta'};
M_.param_names_tex(6) = {'delta'};
M_.param_names_long(6) = {'delta'};
M_.param_names(7) = {'eta'};
M_.param_names_tex(7) = {'eta'};
M_.param_names_long(7) = {'eta'};
M_.param_names(8) = {'o'};
M_.param_names_tex(8) = {'o'};
M_.param_names_long(8) = {'o'};
M_.param_names(9) = {'chi'};
M_.param_names_tex(9) = {'chi'};
M_.param_names_long(9) = {'chi'};
M_.param_names(10) = {'upsilon'};
M_.param_names_tex(10) = {'upsilon'};
M_.param_names_long(10) = {'upsilon'};
M_.param_names(11) = {'eta_c'};
M_.param_names_tex(11) = {'eta\_c'};
M_.param_names_long(11) = {'eta_c'};
M_.param_names(12) = {'o_c'};
M_.param_names_tex(12) = {'o\_c'};
M_.param_names_long(12) = {'o_c'};
M_.param_names(13) = {'omega'};
M_.param_names_tex(13) = {'omega'};
M_.param_names_long(13) = {'omega'};
M_.param_names(14) = {'eta_star'};
M_.param_names_tex(14) = {'eta\_star'};
M_.param_names_long(14) = {'eta_star'};
M_.param_names(15) = {'gamma'};
M_.param_names_tex(15) = {'gamma'};
M_.param_names_long(15) = {'gamma'};
M_.param_names(16) = {'gamma_k'};
M_.param_names_tex(16) = {'gamma\_k'};
M_.param_names_long(16) = {'gamma_k'};
M_.param_names(17) = {'beta'};
M_.param_names_tex(17) = {'beta'};
M_.param_names_long(17) = {'beta'};
M_.param_names(18) = {'xi_bar'};
M_.param_names_tex(18) = {'xi\_bar'};
M_.param_names_long(18) = {'xi_bar'};
M_.param_names(19) = {'omega_G'};
M_.param_names_tex(19) = {'omega\_G'};
M_.param_names_long(19) = {'omega_G'};
M_.param_names(20) = {'delta_g'};
M_.param_names_tex(20) = {'delta\_g'};
M_.param_names_long(20) = {'delta_g'};
M_.param_names(21) = {'o_kg'};
M_.param_names_tex(21) = {'o\_kg'};
M_.param_names_long(21) = {'o_kg'};
M_.param_names(22) = {'o_star'};
M_.param_names_tex(22) = {'o\_star'};
M_.param_names_long(22) = {'o_star'};
M_.param_names(23) = {'tau_c_bar'};
M_.param_names_tex(23) = {'tau\_c\_bar'};
M_.param_names_long(23) = {'tau_c_bar'};
M_.param_names(24) = {'tau_n_bar'};
M_.param_names_tex(24) = {'tau\_n\_bar'};
M_.param_names_long(24) = {'tau_n_bar'};
M_.param_names(25) = {'tau_k_bar'};
M_.param_names_tex(25) = {'tau\_k\_bar'};
M_.param_names_long(25) = {'tau_k_bar'};
M_.param_names(26) = {'g_i_bar'};
M_.param_names_tex(26) = {'g\_i\_bar'};
M_.param_names_long(26) = {'g_i_bar'};
M_.param_names(27) = {'alpha_g_i'};
M_.param_names_tex(27) = {'alpha\_g\_i'};
M_.param_names_long(27) = {'alpha_g_i'};
M_.param_names(28) = {'gamma_g_i'};
M_.param_names_tex(28) = {'gamma\_g\_i'};
M_.param_names_long(28) = {'gamma_g_i'};
M_.param_names(29) = {'g_c_bar'};
M_.param_names_tex(29) = {'g\_c\_bar'};
M_.param_names_long(29) = {'g_c_bar'};
M_.param_names(30) = {'alpha_g_c'};
M_.param_names_tex(30) = {'alpha\_g\_c'};
M_.param_names_long(30) = {'alpha_g_c'};
M_.param_names(31) = {'gamma_g_c'};
M_.param_names_tex(31) = {'gamma\_g\_c'};
M_.param_names_long(31) = {'gamma_g_c'};
M_.param_names(32) = {'tr_bar'};
M_.param_names_tex(32) = {'tr\_bar'};
M_.param_names_long(32) = {'tr_bar'};
M_.param_names(33) = {'alpha_TR'};
M_.param_names_tex(33) = {'alpha\_TR'};
M_.param_names_long(33) = {'alpha_TR'};
M_.param_names(34) = {'gamma_TR'};
M_.param_names_tex(34) = {'gamma\_TR'};
M_.param_names_long(34) = {'gamma_TR'};
M_.param_names(35) = {'rho_g_i'};
M_.param_names_tex(35) = {'rho\_g\_i'};
M_.param_names_long(35) = {'rho_g_i'};
M_.param_names(36) = {'rho_g_c'};
M_.param_names_tex(36) = {'rho\_g\_c'};
M_.param_names_long(36) = {'rho_g_c'};
M_.param_names(37) = {'rho_TR'};
M_.param_names_tex(37) = {'rho\_TR'};
M_.param_names_long(37) = {'rho_TR'};
M_.param_names(38) = {'sig_g_i'};
M_.param_names_tex(38) = {'sig\_g\_i'};
M_.param_names_long(38) = {'sig_g_i'};
M_.param_names(39) = {'sig_g_c'};
M_.param_names_tex(39) = {'sig\_g\_c'};
M_.param_names_long(39) = {'sig_g_c'};
M_.param_names(40) = {'sig_TR'};
M_.param_names_tex(40) = {'sig\_TR'};
M_.param_names_long(40) = {'sig_TR'};
M_.param_names(41) = {'rho_v'};
M_.param_names_tex(41) = {'rho\_v'};
M_.param_names_long(41) = {'rho_v'};
M_.param_names(42) = {'rho_kappa'};
M_.param_names_tex(42) = {'rho\_kappa'};
M_.param_names_long(42) = {'rho_kappa'};
M_.param_names(43) = {'rho_u'};
M_.param_names_tex(43) = {'rho\_u'};
M_.param_names_long(43) = {'rho_u'};
M_.param_names(44) = {'rho_z'};
M_.param_names_tex(44) = {'rho\_z'};
M_.param_names_long(44) = {'rho_z'};
M_.param_names(45) = {'rho_a'};
M_.param_names_tex(45) = {'rho\_a'};
M_.param_names_long(45) = {'rho_a'};
M_.param_names(46) = {'rho_zeta'};
M_.param_names_tex(46) = {'rho\_zeta'};
M_.param_names_long(46) = {'rho_zeta'};
M_.param_names(47) = {'rho_yCo'};
M_.param_names_tex(47) = {'rho\_yCo'};
M_.param_names_long(47) = {'rho_yCo'};
M_.param_names(48) = {'rho_Rstar'};
M_.param_names_tex(48) = {'rho\_Rstar'};
M_.param_names_long(48) = {'rho_Rstar'};
M_.param_names(49) = {'rho_pCostar'};
M_.param_names_tex(49) = {'rho\_pCostar'};
M_.param_names_long(49) = {'rho_pCostar'};
M_.param_names(50) = {'rho_y_star'};
M_.param_names_tex(50) = {'rho\_y\_star'};
M_.param_names_long(50) = {'rho_y_star'};
M_.param_names(51) = {'sig_v'};
M_.param_names_tex(51) = {'sig\_v'};
M_.param_names_long(51) = {'sig_v'};
M_.param_names(52) = {'sig_kappa'};
M_.param_names_tex(52) = {'sig\_kappa'};
M_.param_names_long(52) = {'sig_kappa'};
M_.param_names(53) = {'sig_u'};
M_.param_names_tex(53) = {'sig\_u'};
M_.param_names_long(53) = {'sig_u'};
M_.param_names(54) = {'sig_z'};
M_.param_names_tex(54) = {'sig\_z'};
M_.param_names_long(54) = {'sig_z'};
M_.param_names(55) = {'sig_a'};
M_.param_names_tex(55) = {'sig\_a'};
M_.param_names_long(55) = {'sig_a'};
M_.param_names(56) = {'sig_zeta'};
M_.param_names_tex(56) = {'sig\_zeta'};
M_.param_names_long(56) = {'sig_zeta'};
M_.param_names(57) = {'sig_yCo'};
M_.param_names_tex(57) = {'sig\_yCo'};
M_.param_names_long(57) = {'sig_yCo'};
M_.param_names(58) = {'sig_Rstar'};
M_.param_names_tex(58) = {'sig\_Rstar'};
M_.param_names_long(58) = {'sig_Rstar'};
M_.param_names(59) = {'sig_pCostar'};
M_.param_names_tex(59) = {'sig\_pCostar'};
M_.param_names_long(59) = {'sig_pCostar'};
M_.param_names(60) = {'sig_y_star'};
M_.param_names_tex(60) = {'sig\_y\_star'};
M_.param_names_long(60) = {'sig_y_star'};
M_.param_names(61) = {'v_ss'};
M_.param_names_tex(61) = {'v\_ss'};
M_.param_names_long(61) = {'v_ss'};
M_.param_names(62) = {'kappa_o_ss'};
M_.param_names_tex(62) = {'kappa\_o\_ss'};
M_.param_names_long(62) = {'kappa_o_ss'};
M_.param_names(63) = {'kappa_r_ss'};
M_.param_names_tex(63) = {'kappa\_r\_ss'};
M_.param_names_long(63) = {'kappa_r_ss'};
M_.param_names(64) = {'u_ss'};
M_.param_names_tex(64) = {'u\_ss'};
M_.param_names_long(64) = {'u_ss'};
M_.param_names(65) = {'z_ss'};
M_.param_names_tex(65) = {'z\_ss'};
M_.param_names_long(65) = {'z_ss'};
M_.param_names(66) = {'a_ss'};
M_.param_names_tex(66) = {'a\_ss'};
M_.param_names_long(66) = {'a_ss'};
M_.param_names(67) = {'zeta_ss'};
M_.param_names_tex(67) = {'zeta\_ss'};
M_.param_names_long(67) = {'zeta_ss'};
M_.param_names(68) = {'yCo_ss'};
M_.param_names_tex(68) = {'yCo\_ss'};
M_.param_names_long(68) = {'yCo_ss'};
M_.param_names(69) = {'pCostar_ss'};
M_.param_names_tex(69) = {'pCostar\_ss'};
M_.param_names_long(69) = {'pCostar_ss'};
M_.param_names(70) = {'Rstar_ss'};
M_.param_names_tex(70) = {'Rstar\_ss'};
M_.param_names_long(70) = {'Rstar_ss'};
M_.param_names(71) = {'y_star_ss'};
M_.param_names_tex(71) = {'y\_star\_ss'};
M_.param_names_long(71) = {'y_star_ss'};
M_.param_names(72) = {'sCo_ss'};
M_.param_names_tex(72) = {'sCo\_ss'};
M_.param_names_long(72) = {'sCo_ss'};
M_.param_names(73) = {'sg_ss'};
M_.param_names_tex(73) = {'sg\_ss'};
M_.param_names_long(73) = {'sg_ss'};
M_.param_names(74) = {'str_ss'};
M_.param_names_tex(74) = {'str\_ss'};
M_.param_names_long(74) = {'str_ss'};
M_.param_names(75) = {'T_ss'};
M_.param_names_tex(75) = {'T\_ss'};
M_.param_names_long(75) = {'T_ss'};
M_.param_names(76) = {'h_o_ss'};
M_.param_names_tex(76) = {'h\_o\_ss'};
M_.param_names_long(76) = {'h_o_ss'};
M_.param_names(77) = {'h_r_ss'};
M_.param_names_tex(77) = {'h\_r\_ss'};
M_.param_names_long(77) = {'h_r_ss'};
M_.param_names(78) = {'p_ss'};
M_.param_names_tex(78) = {'p\_ss'};
M_.param_names_long(78) = {'p_ss'};
M_.param_names(79) = {'i_r'};
M_.param_names_tex(79) = {'i\_r'};
M_.param_names_long(79) = {'i_r'};
M_.param_names(80) = {'k_r'};
M_.param_names_tex(80) = {'k\_r'};
M_.param_names_long(80) = {'k_r'};
M_.param_names(81) = {'b_bar'};
M_.param_names_tex(81) = {'b\_bar'};
M_.param_names_long(81) = {'b_bar'};
M_.param_names(82) = {'sf_ss'};
M_.param_names_tex(82) = {'sf\_ss'};
M_.param_names_long(82) = {'sf_ss'};
M_.param_names(83) = {'fb_star_bar'};
M_.param_names_tex(83) = {'fb\_star\_bar'};
M_.param_names_long(83) = {'fb_star_bar'};
M_.param_names(84) = {'y_ss'};
M_.param_names_tex(84) = {'y\_ss'};
M_.param_names_long(84) = {'y_ss'};
M_.param_names(85) = {'b_star_ss'};
M_.param_names_tex(85) = {'b\_star\_ss'};
M_.param_names_long(85) = {'b_star_ss'};
M_.param_names(86) = {'f_star_ss'};
M_.param_names_tex(86) = {'f\_star\_ss'};
M_.param_names_long(86) = {'f_star_ss'};
M_.param_names(87) = {'tb_ss'};
M_.param_names_tex(87) = {'tb\_ss'};
M_.param_names_long(87) = {'tb_ss'};
M_.param_names(88) = {'h_ss'};
M_.param_names_tex(88) = {'h\_ss'};
M_.param_names_long(88) = {'h_ss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 27;
M_.endo_nbr = 89;
M_.param_nbr = 88;
M_.orig_endo_nbr = 83;
M_.aux_vars(1).endo_index = 84;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 58;
M_.aux_vars(1).orig_lead_lag = -1;
M_.aux_vars(1).orig_expr = 'yNCo(-1)';
M_.aux_vars(2).endo_index = 85;
M_.aux_vars(2).type = 1;
M_.aux_vars(2).orig_index = 58;
M_.aux_vars(2).orig_lead_lag = -2;
M_.aux_vars(2).orig_expr = 'AUX_ENDO_LAG_57_1(-1)';
M_.aux_vars(3).endo_index = 86;
M_.aux_vars(3).type = 1;
M_.aux_vars(3).orig_index = 58;
M_.aux_vars(3).orig_lead_lag = -3;
M_.aux_vars(3).orig_expr = 'AUX_ENDO_LAG_57_2(-1)';
M_.aux_vars(4).endo_index = 87;
M_.aux_vars(4).type = 1;
M_.aux_vars(4).orig_index = 52;
M_.aux_vars(4).orig_lead_lag = -1;
M_.aux_vars(4).orig_expr = 'a(-1)';
M_.aux_vars(5).endo_index = 88;
M_.aux_vars(5).type = 1;
M_.aux_vars(5).orig_index = 52;
M_.aux_vars(5).orig_lead_lag = -2;
M_.aux_vars(5).orig_expr = 'AUX_ENDO_LAG_51_1(-1)';
M_.aux_vars(6).endo_index = 89;
M_.aux_vars(6).type = 1;
M_.aux_vars(6).orig_index = 52;
M_.aux_vars(6).orig_lead_lag = -3;
M_.aux_vars(6).orig_expr = 'AUX_ENDO_LAG_51_2(-1)';
options_.varobs = cell(13, 1);
options_.varobs(1)  = {'gam_YNCo_obs'};
options_.varobs(2)  = {'gam_C_obs'};
options_.varobs(3)  = {'gam_I_obs'};
options_.varobs(4)  = {'xi_obs'};
options_.varobs(5)  = {'pCostar_obs'};
options_.varobs(6)  = {'YCo_obs'};
options_.varobs(7)  = {'Rstar_obs'};
options_.varobs(8)  = {'Ystar_obs'};
options_.varobs(9)  = {'gam_G_obs'};
options_.varobs(10)  = {'gam_Ig_obs'};
options_.varobs(11)  = {'gam_TR_obs'};
options_.varobs(12)  = {'ratio_TBY_obs'};
options_.varobs(13)  = {'hours_obs'};
options_.varobs_id = [ 70 72 73 74 75 76 78 79 77 80 81 82 83  ];
M_.Sigma_e = zeros(27, 27);
M_.Correlation_matrix = eye(27, 27);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [1 2 4 5 7 8 9 10 11 12 15 16 18 19 20 23 24 25 26 28 29 30 31 32 33 34 37 38 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 75 76 77 78 83];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 83;
M_.eq_nbr = 89;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 4;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 4;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 4;
M_.lead_lag_incidence = [
 0 37 126;
 0 38 0;
 1 39 0;
 0 40 0;
 2 41 127;
 3 42 0;
 0 43 0;
 0 44 0;
 4 45 0;
 0 46 0;
 0 47 0;
 5 48 0;
 0 49 0;
 0 50 0;
 6 51 0;
 7 52 0;
 0 53 0;
 8 54 0;
 9 55 0;
 10 56 0;
 0 57 128;
 0 58 0;
 0 59 129;
 11 60 0;
 0 61 0;
 0 62 0;
 0 63 0;
 0 64 0;
 0 65 0;
 0 66 0;
 0 67 0;
 0 68 0;
 12 69 0;
 0 70 0;
 13 71 0;
 0 72 130;
 0 73 0;
 0 74 0;
 14 75 0;
 15 76 0;
 16 77 0;
 17 78 0;
 0 79 0;
 0 80 0;
 18 81 0;
 0 82 0;
 19 83 131;
 20 84 0;
 21 85 0;
 22 86 132;
 23 87 0;
 24 88 0;
 25 89 0;
 26 90 0;
 27 91 0;
 28 92 0;
 29 93 0;
 30 94 0;
 0 95 0;
 0 96 0;
 0 97 0;
 0 98 0;
 0 99 0;
 0 100 0;
 0 101 0;
 0 102 0;
 0 103 0;
 0 104 0;
 0 105 0;
 0 106 0;
 0 107 0;
 0 108 0;
 0 109 0;
 0 110 0;
 0 111 0;
 0 112 0;
 0 113 0;
 0 114 0;
 0 115 0;
 0 116 0;
 0 117 0;
 0 118 0;
 0 119 0;
 31 120 0;
 32 121 0;
 33 122 0;
 34 123 0;
 35 124 0;
 36 125 0;]';
M_.nstatic = 49;
M_.nfwrd   = 4;
M_.npred   = 33;
M_.nboth   = 3;
M_.nsfwrd   = 7;
M_.nspred   = 36;
M_.ndynamic   = 40;
M_.dynamic_tmp_nbr = [78; 117; 39; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Optimizer Marginal Utility of Consumption' ;
  2 , 'name' , 'Rule of Thumb Marginal Utility of Consumption' ;
  3 , 'name' , 'Aggregate Private Consumption' ;
  4 , 'name' , 'Optimizer Consumption/Leisure Condition' ;
  5 , 'name' , 'Rule of Thumb Comsumption/Leausre Condition' ;
  6 , 'name' , 'Aggregate Labor Supply' ;
  7 , 'name' , 'Optimizer Euler Equation' ;
  8 , 'name' , 'Final Good Production' ;
  9 , 'name' , 'Domestic Demand for Foreign Goods' ;
  10 , 'name' , 'Doemstic Demand for Home Goods' ;
  11 , 'name' , 'Foreign Demand for Home Goods' ;
  12 , 'name' , 'Home Good Production Function' ;
  13 , 'name' , 'Home Good Market Clearing' ;
  14 , 'name' , 'Final Good Market Clearing' ;
  15 , 'name' , 'GDP In Terms of Foreing Good' ;
  16 , 'name' , 'Trade Balance' ;
  17 , 'name' , 'Aggregate Privately Held Foreign Debt' ;
  18 , 'name' , 'Balance of Payments Identity' ;
  19 , 'name' , 'Country Premium' ;
  20 , 'name' , 'Evolution of Optimizer Capital' ;
  21 , 'name' , 'Aggregate Private Capital' ;
  22 , 'name' , 'Aggregate Private Investment' ;
  23 , 'name' , 'Tobins q for Private Investment' ;
  24 , 'name' , 'Return to Capital Equals Marginal Product of Capital' ;
  25 , 'name' , 'Wage Equals Marginal Product of Labor' ;
  26 , 'name' , 'Optimzer Investment First Order Condition' ;
  27 , 'name' , 'Import Market Clearing' ;
  28 , 'name' , 'Optimizer Consumption Composite' ;
  29 , 'name' , 'Rule of Thumb Consumption Composite' ;
  30 , 'name' , 'Optimizer Wealth Effect on Labor Supply 1' ;
  31 , 'name' , 'Optimizer Wealth Effect on Labor Supply 2' ;
  32 , 'name' , 'Rule of Thumb Wealth Effect on Labor Supply 1' ;
  33 , 'name' , 'Rule of Thumb Wealth Effect on Labor Supply 2' ;
  34 , 'name' , 'Government Budget Constraint' ;
  35 , 'name' , 'Transfers to Optimizers' ;
  36 , 'name' , 'Transfers to Rule of Thumb' ;
  37 , 'name' , 'Profits of Home Good Producer' ;
  38 , 'name' , 'Evolution of Government Capital' ;
  39 , 'name' , 'Consumption Tax' ;
  40 , 'name' , 'Labor Tax' ;
  41 , 'name' , 'Capital Tax' ;
  42 , 'name' , 'Government Investment Rule' ;
  43 , 'name' , 'Government Consumption Rule' ;
  44 , 'name' , 'Government Transfers Rule' ;
  45 , 'name' , 'Rule of Thumb Budget Constraint' ;
  46 , 'name' , 'Real Non-Oil GDP' ;
  47 , 'name' , 'Time Preference Shifter Process' ;
  48 , 'name' , 'Optimizer Labor Supply Preference Shifter Process' ;
  49 , 'name' , 'Rule of Thumb Labor Supply Preference Shifter Process' ;
  50 , 'name' , 'Investment Specific Productivity Process' ;
  51 , 'name' , 'TFP Process' ;
  52 , 'name' , 'Growth Rate Process' ;
  53 , 'name' , 'Oil Quantity Process' ;
  54 , 'name' , 'Idiosyncratic Component of Country Premium Process' ;
  55 , 'name' , 'Foreign Inerest Rate Process' ;
  56 , 'name' , 'Foreign GDP Process' ;
  57 , 'name' , 'Oil Price Process' ;
  58 , 'name' , 'Non-oil GDP' ;
  59 , 'name' , 'Growth Rate of Non-oil GDP' ;
  60 , 'name' , 'Annual Q/Q Growth Rate of Non-oil GDP' ;
  61 , 'name' , 'Growth Rate of Private Consumption' ;
  62 , 'name' , 'Growth Rate of Total Investment' ;
  63 , 'name' , 'Growth Rate of Government Consumption' ;
  64 , 'name' , 'Growth Rate of Government Investment' ;
  65 , 'name' , 'Change in Government Debt Over GDP' ;
  66 , 'name' , 'Change in foreign Debt Over GDP' ;
  67 , 'name' , 'Real Exchange Rate' ;
  68 , 'name' , 'Trade Balance Over GDP' ;
  69 , 'name' , 'Growt Rate of Government Transfers' ;
  70 , 'name' , 'Growth Rate of Non-oil GDP (Observation)' ;
  71 , 'name' , 'Annual Q/Q Growth Rate of Non-oil GDP (Observation)' ;
  72 , 'name' , 'Growth Rate of Private Consumption (Observation)' ;
  73 , 'name' , 'Growth Rate of Total Investment (Observation)' ;
  74 , 'name' , 'Country Premium (Observation)' ;
  75 , 'name' , 'Oil Price (Observation)' ;
  76 , 'name' , 'Oil Quantity (Observation)' ;
  77 , 'name' , 'Foreign Interest Rate (Observation)' ;
  78 , 'name' , 'Foreign GDP (Observation)' ;
  79 , 'name' , 'Growth Rate of Government Consumption (Observation)' ;
  80 , 'name' , 'Growth Rate of Government Investment (Observation)' ;
  81 , 'name' , 'Growth Rate of Transfers (Observation)' ;
  82 , 'name' , 'Trade Balance Over GDP (Observation)' ;
  83 , 'name' , 'Hours (Observation)' ;
};
M_.mapping.lam_o.eqidx = [1 4 7 23 26 ];
M_.mapping.c_hat_o.eqidx = [1 28 ];
M_.mapping.c_o.eqidx = [1 3 28 30 31 ];
M_.mapping.h_o.eqidx = [4 6 34 ];
M_.mapping.i_o.eqidx = [20 22 26 ];
M_.mapping.k_o.eqidx = [20 21 ];
M_.mapping.f_star_o.eqidx = [17 ];
M_.mapping.Theta_o.eqidx = [4 30 ];
M_.mapping.chitil_o.eqidx = [30 31 ];
M_.mapping.lam_r.eqidx = [2 5 ];
M_.mapping.c_hat_r.eqidx = [2 29 ];
M_.mapping.c_r.eqidx = [2 3 29 32 33 45 ];
M_.mapping.h_r.eqidx = [5 6 45 ];
M_.mapping.Theta_r.eqidx = [5 32 ];
M_.mapping.chitil_r.eqidx = [32 33 ];
M_.mapping.c.eqidx = [3 14 15 34 61 ];
M_.mapping.h.eqidx = [6 12 25 83 ];
M_.mapping.i.eqidx = [14 15 22 62 ];
M_.mapping.k.eqidx = [12 21 24 34 ];
M_.mapping.f_star.eqidx = [17 18 19 66 ];
M_.mapping.q.eqidx = [23 26 ];
M_.mapping.w.eqidx = [4 5 25 34 45 ];
M_.mapping.rK.eqidx = [23 24 34 ];
M_.mapping.y.eqidx = [15 19 42 43 44 58 65 66 68 ];
M_.mapping.yC.eqidx = [8 9 10 14 ];
M_.mapping.yF.eqidx = [16 27 ];
M_.mapping.yH.eqidx = [12 13 24 25 37 46 ];
M_.mapping.xF.eqidx = [8 9 27 ];
M_.mapping.xH.eqidx = [8 10 13 ];
M_.mapping.xHstar.eqidx = [11 13 16 ];
M_.mapping.pi.eqidx = [37 ];
M_.mapping.pH.eqidx = [10 11 16 24 25 37 46 ];
M_.mapping.p.eqidx = [1 2 9 10 15 26 34 45 46 61 62 63 64 67 ];
M_.mapping.tb.eqidx = [15 16 18 68 ];
M_.mapping.xi.eqidx = [7 18 19 34 74 ];
M_.mapping.tau_k.eqidx = [23 34 41 ];
M_.mapping.tau_n.eqidx = [4 34 40 ];
M_.mapping.tau_c.eqidx = [1 2 34 39 45 ];
M_.mapping.k_g.eqidx = [12 38 ];
M_.mapping.g_c.eqidx = [14 15 28 29 34 43 63 ];
M_.mapping.g_i.eqidx = [14 15 34 38 42 62 64 ];
M_.mapping.tr.eqidx = [34 35 36 44 69 ];
M_.mapping.tr_o.eqidx = [35 ];
M_.mapping.tr_r.eqidx = [36 45 ];
M_.mapping.b_star.eqidx = [18 19 34 42 43 44 65 ];
M_.mapping.gdp_nco.eqidx = [46 ];
M_.mapping.v.eqidx = [7 23 26 47 ];
M_.mapping.kappa_o.eqidx = [4 48 ];
M_.mapping.kappa_r.eqidx = [5 49 ];
M_.mapping.u.eqidx = [20 26 50 ];
M_.mapping.z.eqidx = [12 51 ];
M_.mapping.a.eqidx = [1 2 7 12 18 20 23 24 26 28 29 30 31 32 33 34 38 52 59 60 61 62 63 64 65 66 69 ];
M_.mapping.zeta.eqidx = [19 54 ];
M_.mapping.yCo.eqidx = [16 18 34 53 58 76 ];
M_.mapping.pCostar.eqidx = [16 18 34 57 58 75 ];
M_.mapping.Rstar.eqidx = [7 18 34 55 77 ];
M_.mapping.y_star.eqidx = [11 56 78 ];
M_.mapping.yNCo.eqidx = [58 59 60 ];
M_.mapping.gam_YNCo.eqidx = [59 70 ];
M_.mapping.gama_YNCo.eqidx = [60 71 ];
M_.mapping.gam_C.eqidx = [61 72 ];
M_.mapping.gam_I.eqidx = [62 73 ];
M_.mapping.gam_G.eqidx = [63 79 ];
M_.mapping.gam_Ig.eqidx = [64 80 ];
M_.mapping.ratio_BY.eqidx = [65 ];
M_.mapping.ratio_TBY.eqidx = [68 82 ];
M_.mapping.rer.eqidx = [67 ];
M_.mapping.gam_TR.eqidx = [69 81 ];
M_.mapping.ratio_FY.eqidx = [66 ];
M_.mapping.gam_YNCo_obs.eqidx = [70 ];
M_.mapping.gama_YNCo_obs.eqidx = [71 ];
M_.mapping.gam_C_obs.eqidx = [72 ];
M_.mapping.gam_I_obs.eqidx = [73 ];
M_.mapping.xi_obs.eqidx = [74 ];
M_.mapping.pCostar_obs.eqidx = [75 ];
M_.mapping.YCo_obs.eqidx = [76 ];
M_.mapping.gam_G_obs.eqidx = [79 ];
M_.mapping.Rstar_obs.eqidx = [77 ];
M_.mapping.Ystar_obs.eqidx = [78 ];
M_.mapping.gam_Ig_obs.eqidx = [80 ];
M_.mapping.gam_TR_obs.eqidx = [81 ];
M_.mapping.ratio_TBY_obs.eqidx = [82 ];
M_.mapping.hours_obs.eqidx = [83 ];
M_.mapping.eps_v.eqidx = [47 ];
M_.mapping.eps_kappa.eqidx = [48 49 ];
M_.mapping.eps_u.eqidx = [50 ];
M_.mapping.eps_z.eqidx = [51 ];
M_.mapping.eps_a.eqidx = [52 ];
M_.mapping.eps_zeta.eqidx = [54 ];
M_.mapping.eps_yCo.eqidx = [53 ];
M_.mapping.eps_Rstar.eqidx = [55 ];
M_.mapping.eps_pCostar.eqidx = [57 ];
M_.mapping.eps_y_star.eqidx = [56 ];
M_.mapping.eps_g_c.eqidx = [43 ];
M_.mapping.eps_g_i.eqidx = [42 ];
M_.mapping.eps_TR.eqidx = [44 ];
M_.mapping.eps_gam_YNCo_obs.eqidx = [70 ];
M_.mapping.eps_gam_C_obs.eqidx = [72 ];
M_.mapping.eps_gam_I_obs.eqidx = [73 ];
M_.mapping.eps_xi_obs.eqidx = [74 ];
M_.mapping.eps_pCostar_obs.eqidx = [75 ];
M_.mapping.eps_YCo_obs.eqidx = [76 ];
M_.mapping.eps_gam_G_obs.eqidx = [79 ];
M_.mapping.eps_Rstar_obs.eqidx = [77 ];
M_.mapping.eps_Ystar_obs.eqidx = [78 ];
M_.mapping.eps_gam_Ig_obs.eqidx = [80 ];
M_.mapping.eps_gam_TR_obs.eqidx = [81 ];
M_.mapping.eps_ratio_TBY_obs.eqidx = [82 ];
M_.mapping.eps_hours_obs.eqidx = [83 ];
M_.mapping.eps_gama_YNCo_obs.eqidx = [71 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 5 6 9 12 15 16 18 19 20 24 33 35 39 40 41 42 45 47 48 49 50 51 52 53 54 55 56 57 58 84 85 86 87 88 89 ];
M_.exo_names_orig_ord = [1:27];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(89, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(27, 1);
M_.params = NaN(88, 1);
M_.endo_trends = struct('deflator', cell(89, 1), 'log_deflator', cell(89, 1), 'growth_factor', cell(89, 1), 'log_growth_factor', cell(89, 1));
M_.NNZDerivatives = [378; 851; -1; ];
M_.static_tmp_nbr = [64; 72; 32; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(3) = 1;
sigma = M_.params(3);
M_.params(6) = 0.015;
delta = M_.params(6);
M_.params(8) = 0.27;
o = M_.params(8);
M_.params(9) = 0.74;
chi = M_.params(9);
M_.params(13) = .7;
omega = M_.params(13);
M_.params(19) = 1;
omega_G = M_.params(19);
M_.params(20) = 0.015;
delta_g = M_.params(20);
M_.params(12) = .25;
o_c = M_.params(12);
M_.params(21) = .1;
o_kg = M_.params(21);
M_.params(15) = M_.params(21)*.34;
gamma = M_.params(15);
M_.params(5) = 0.34-M_.params(15);
alpha = M_.params(5);
M_.params(14) = 0.25;
eta_star = M_.params(14);
M_.params(82) = .256;
sf_ss = M_.params(82);
M_.params(73) = 0.106;
sg_ss = M_.params(73);
M_.params(74) = .049;
str_ss = M_.params(74);
M_.params(72) = 0.082;
sCo_ss = M_.params(72);
M_.params(66) = 1.004962931573204;
a_ss = M_.params(66);
M_.params(70) = 1.000978953692953;
Rstar_ss = M_.params(70);
M_.params(18) = 1.012705786773885;
xi_bar = M_.params(18);
M_.params(23) = .12;
tau_c_bar = M_.params(23);
M_.params(25) = .25;
tau_k_bar = M_.params(25);
M_.params(24) = .04;
tau_n_bar = M_.params(24);
M_.params(81) = 1.42;
b_bar = M_.params(81);
M_.params(79) = .16;
i_r = M_.params(79);
M_.params(76) = 0.29543;
h_o_ss = M_.params(76);
M_.params(77) = 0.29543;
h_r_ss = M_.params(77);
M_.params(61) = 1;
v_ss = M_.params(61);
M_.params(64) = 1;
u_ss = M_.params(64);
M_.params(78) = 1;
p_ss = M_.params(78);
M_.params(65) = 1;
z_ss = M_.params(65);
M_.params(67) = 1;
zeta_ss = M_.params(67);
M_.params(71) = 1;
y_star_ss = M_.params(71);
M_.params(69) = 1;
pCostar_ss = M_.params(69);
M_.params(47) = 0.645978544032117;
rho_yCo = M_.params(47);
M_.params(48) = 0.7333263129578;
rho_Rstar = M_.params(48);
M_.params(50) = 0.900547920881103;
rho_y_star = M_.params(50);
M_.params(49) = 0.87142;
rho_pCostar = M_.params(49);
M_.params(57) = 0.2068456510301851;
sig_yCo = M_.params(57);
M_.params(58) = 0.002467793820158299;
sig_Rstar = M_.params(58);
M_.params(60) = 0.004860470962342755;
sig_y_star = M_.params(60);
M_.params(59) = 0.1918254414826146;
sig_pCostar = M_.params(59);
M_.params(35) = 0.475066770320351;
rho_g_i = M_.params(35);
M_.params(27) = 1.77181463858898;
alpha_g_i = M_.params(27);
M_.params(28) = (-0.128020819907481);
gamma_g_i = M_.params(28);
M_.params(38) = 0.152928493631706;
sig_g_i = M_.params(38);
M_.params(36) = 0.700008971370747;
rho_g_c = M_.params(36);
M_.params(30) = 0.133003777051124;
alpha_g_c = M_.params(30);
M_.params(31) = (-0.00559524541775913);
gamma_g_c = M_.params(31);
M_.params(39) = 0.0270612481674496;
sig_g_c = M_.params(39);
M_.params(37) = 0.371415315040748;
rho_TR = M_.params(37);
M_.params(33) = 3.51994486226213;
alpha_TR = M_.params(33);
M_.params(34) = (-0.348167302489475);
gamma_TR = M_.params(34);
M_.params(40) = 0.0975543556649158;
sig_TR = M_.params(40);
M_.params(4) = 0.1;
phi = M_.params(4);
M_.params(1) = 0.9;
varsigma = M_.params(1);
M_.params(2) = 0.5;
hpsi = M_.params(2);
M_.params(7) = 3;
eta = M_.params(7);
M_.params(16) = 6;
gamma_k = M_.params(16);
M_.params(11) = 1.5;
eta_c = M_.params(11);
M_.params(10) = 0.5;
upsilon = M_.params(10);
M_.params(41) = 0.75;
rho_v = M_.params(41);
M_.params(42) = 0.75;
rho_kappa = M_.params(42);
M_.params(43) = 0.75;
rho_u = M_.params(43);
M_.params(44) = 0.75;
rho_z = M_.params(44);
M_.params(45) = 0.75;
rho_a = M_.params(45);
M_.params(46) = 0.75;
rho_zeta = M_.params(46);
M_.params(51) = 1;
sig_v = M_.params(51);
M_.params(52) = 4;
sig_kappa = M_.params(52);
M_.params(53) = 1;
sig_u = M_.params(53);
M_.params(54) = 0.1;
sig_z = M_.params(54);
M_.params(55) = 0.1;
sig_a = M_.params(55);
M_.params(56) = 0.9;
sig_zeta = M_.params(56);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(51)^2;
M_.Sigma_e(2, 2) = M_.params(52)^2;
M_.Sigma_e(3, 3) = M_.params(53)^2;
M_.Sigma_e(4, 4) = M_.params(54)^2;
M_.Sigma_e(5, 5) = M_.params(55)^2;
M_.Sigma_e(6, 6) = M_.params(56)^2;
M_.Sigma_e(7, 7) = M_.params(57)^2;
M_.Sigma_e(8, 8) = M_.params(58)^2;
M_.Sigma_e(9, 9) = M_.params(59)^2;
M_.Sigma_e(10, 10) = M_.params(60)^2;
M_.Sigma_e(11, 11) = M_.params(39)^2;
M_.Sigma_e(12, 12) = M_.params(38)^2;
M_.Sigma_e(13, 13) = M_.params(40)^2;
M_.Sigma_e(14, 14) = 2.77994e-05;
M_.Sigma_e(15, 15) = 3.68488e-05;
M_.Sigma_e(16, 16) = 0.0001211819;
M_.Sigma_e(17, 17) = 0;
M_.Sigma_e(18, 18) = 0;
M_.Sigma_e(19, 19) = 0;
M_.Sigma_e(20, 20) = 0;
M_.Sigma_e(21, 21) = 0;
M_.Sigma_e(22, 22) = 0;
M_.Sigma_e(23, 23) = 0;
M_.Sigma_e(24, 24) = 0;
M_.Sigma_e(25, 25) = 3.96066e-05;
M_.Sigma_e(26, 26) = 3.973210000000001e-05;
M_.Sigma_e(27, 27) = 0.0002371601;
M_.shock_groups.default.group1.label = 'Technology';
M_.shock_groups.default.group1.shocks = { 'eps_u' 'eps_z' 'eps_a'};
M_.shock_groups.default.group2.label = 'Foreign';
M_.shock_groups.default.group2.shocks = { 'eps_Rstar' 'eps_y_star'};
M_.shock_groups.default.group3.label = 'Oil';
M_.shock_groups.default.group3.shocks = { 'eps_pCostar' 'eps_yCo'};
M_.shock_groups.default.group4.label = 'Risk';
M_.shock_groups.default.group4.shocks = { 'eps_zeta'};
M_.shock_groups.default.group5.label = 'Preference';
M_.shock_groups.default.group5.shocks = { 'eps_v' 'eps_kappa'};
M_.shock_groups.default.group6.label = 'Fiscal';
M_.shock_groups.default.group6.shocks = { 'eps_g_c' 'eps_g_i' 'eps_TR'};
M_.shock_groups.default.group7.label = 'Measurement';
M_.shock_groups.default.group7.shocks = { 'eps_gam_YNCo_obs' 'eps_gam_C_obs' 'eps_gam_I_obs' 'eps_xi_obs' 'eps_pCostar_obs' 'eps_YCo_obs' 'eps_gam_G_obs' 'eps_Rstar_obs' 'eps_Ystar_obs' 'eps_gam_Ig_obs' 'eps_gam_TR_obs' 'eps_ratio_TBY_obs' 'eps_hours_obs' 'eps_gama_YNCo_obs'};
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, 0, Inf, 3, 0.1, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, 0, 1, 3, 0.9, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, 0, Inf, 3, 0.5, 10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, 0, Inf, 3, 3, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 16, NaN, 0, Inf, 3, 6, 10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 11, NaN, 0, Inf, 3, 1.5, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, NaN, 0, 1, 3, 0.5, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 41, NaN, (-Inf), Inf, 1, 0.75, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 42, NaN, (-Inf), Inf, 1, 0.75, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 43, NaN, (-Inf), Inf, 1, 0.75, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 44, NaN, (-Inf), Inf, 1, 0.75, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 45, NaN, (-Inf), Inf, 1, 0.75, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 46, NaN, (-Inf), Inf, 1, 0.75, 0.15, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, 1, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, NaN, (-Inf), Inf, 4, 4, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, NaN, (-Inf), Inf, 4, 1, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 4, NaN, (-Inf), Inf, 4, 0.1, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 5, NaN, (-Inf), Inf, 4, 0.1, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 6, NaN, (-Inf), Inf, 4, 0.9, Inf, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 36, 0.700008, 0, 1, 3, 0.700008, 1, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 11, NaN, (-Inf), Inf, 4, 0.027061, Inf, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 30, NaN, (-Inf), Inf, 3, 0.133003, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 31, (-0.005595), (-Inf), 0, 3, (-0.005595), 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 35, 0.475066, 0, 1, 3, 0.475066, 1, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 12, NaN, (-Inf), Inf, 4, 0.152928, Inf, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 27, NaN, (-Inf), Inf, 3, 1.771814, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 28, (-0.128020), (-Inf), 0, 3, (-0.128020), 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 37, 0.371415, 0, 1, 3, 0.371415, 1, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 13, NaN, (-Inf), Inf, 4, 0.097554, Inf, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 33, NaN, (-Inf), Inf, 3, 3.519944, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 34, (-0.348167), (-Inf), 0, 3, (-0.348167), 2, NaN, NaN, NaN ];
set_dynare_seed('clock'); 
tmp1 = find(estim_params_.param_vals(:,1)==4);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{4}))
else
    estim_params_.param_vals(tmp1,2) = 0.1;
end
tmp1 = find(estim_params_.param_vals(:,1)==1);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{1}))
else
    estim_params_.param_vals(tmp1,2) = 0.9;
end
tmp1 = find(estim_params_.param_vals(:,1)==2);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{2}))
else
    estim_params_.param_vals(tmp1,2) = 0.5;
end
tmp1 = find(estim_params_.param_vals(:,1)==7);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{7}))
else
    estim_params_.param_vals(tmp1,2) = 3;
end
tmp1 = find(estim_params_.param_vals(:,1)==16);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{16}))
else
    estim_params_.param_vals(tmp1,2) = 6;
end
tmp1 = find(estim_params_.param_vals(:,1)==11);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{11}))
else
    estim_params_.param_vals(tmp1,2) = 1.5;
end
tmp1 = find(estim_params_.param_vals(:,1)==10);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{10}))
else
    estim_params_.param_vals(tmp1,2) = 0.5;
end
tmp1 = find(estim_params_.param_vals(:,1)==41);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{41}))
else
    estim_params_.param_vals(tmp1,2) = 0.75;
end
tmp1 = find(estim_params_.param_vals(:,1)==42);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{42}))
else
    estim_params_.param_vals(tmp1,2) = 0.75;
end
tmp1 = find(estim_params_.param_vals(:,1)==43);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{43}))
else
    estim_params_.param_vals(tmp1,2) = 0.75;
end
tmp1 = find(estim_params_.param_vals(:,1)==44);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{44}))
else
    estim_params_.param_vals(tmp1,2) = 0.75;
end
tmp1 = find(estim_params_.param_vals(:,1)==45);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{45}))
else
    estim_params_.param_vals(tmp1,2) = 0.75;
end
tmp1 = find(estim_params_.param_vals(:,1)==46);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{46}))
else
    estim_params_.param_vals(tmp1,2) = 0.75;
end
tmp1 = find(estim_params_.param_vals(:,1)==36);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{36}))
else
    estim_params_.param_vals(tmp1,2) = 0.700008;
end
tmp1 = find(estim_params_.param_vals(:,1)==30);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{30}))
else
    estim_params_.param_vals(tmp1,2) = 0.133003;
end
tmp1 = find(estim_params_.param_vals(:,1)==31);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{31}))
else
    estim_params_.param_vals(tmp1,2) = (-0.005595);
end
tmp1 = find(estim_params_.param_vals(:,1)==35);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{35}))
else
    estim_params_.param_vals(tmp1,2) = 0.475066;
end
tmp1 = find(estim_params_.param_vals(:,1)==27);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{27}))
else
    estim_params_.param_vals(tmp1,2) = 1.771814;
end
tmp1 = find(estim_params_.param_vals(:,1)==28);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{28}))
else
    estim_params_.param_vals(tmp1,2) = (-0.128020);
end
tmp1 = find(estim_params_.param_vals(:,1)==37);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{37}))
else
    estim_params_.param_vals(tmp1,2) = 0.371415;
end
tmp1 = find(estim_params_.param_vals(:,1)==33);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{33}))
else
    estim_params_.param_vals(tmp1,2) = 3.519944;
end
tmp1 = find(estim_params_.param_vals(:,1)==34);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{34}))
else
    estim_params_.param_vals(tmp1,2) = (-0.348167);
end
tmp1 = find(estim_params_.var_exo(:,1)==1);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{1}))
else
    estim_params_.var_exo(tmp1,2) = 1;
end
tmp1 = find(estim_params_.var_exo(:,1)==2);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{2}))
else
    estim_params_.var_exo(tmp1,2) = 4;
end
tmp1 = find(estim_params_.var_exo(:,1)==3);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{3}))
else
    estim_params_.var_exo(tmp1,2) = 1;
end
tmp1 = find(estim_params_.var_exo(:,1)==4);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{4}))
else
    estim_params_.var_exo(tmp1,2) = 0.1;
end
tmp1 = find(estim_params_.var_exo(:,1)==5);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{5}))
else
    estim_params_.var_exo(tmp1,2) = 0.1;
end
tmp1 = find(estim_params_.var_exo(:,1)==6);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{6}))
else
    estim_params_.var_exo(tmp1,2) = 0.9;
end
tmp1 = find(estim_params_.var_exo(:,1)==11);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{11}))
else
    estim_params_.var_exo(tmp1,2) = 0.027061;
end
tmp1 = find(estim_params_.var_exo(:,1)==12);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{12}))
else
    estim_params_.var_exo(tmp1,2) = 0.152928;
end
tmp1 = find(estim_params_.var_exo(:,1)==13);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{13}))
else
    estim_params_.var_exo(tmp1,2) = 0.097554;
end
skipline()
options_.Opt6Numb= 50000;
options_.cova_compute = 1;
options_.mh_drop = 0.5;
options_.mh_jscale = .25;
options_.mh_nblck = 2;
options_.mh_replic = 1000000;
options_.mode_compute = 1;
options_.plot_priors = 0;
options_.datafile = '/mq/manuel_projects/SOEM_EC/data/estim_data.xlsx';
options_.order = 1;
var_list_ = {};
oo_recursive_=dynare_estimation(var_list_);
options_ident = struct();
options_ident.parameter_set = 'posterior_mean';
dynare_identification(options_ident);
save('SOE_Estimation_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('SOE_Estimation_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('SOE_Estimation_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('SOE_Estimation_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('SOE_Estimation_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('SOE_Estimation_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('SOE_Estimation_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
