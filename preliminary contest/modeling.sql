create table contest1_tmp as 
select a.false_flag,
       nvl(cd.visit_cnt,0) visit_cnt,
       nvl(cd.visit_dura,0) visit_dura,
       nvl(cd.up_flow,0) up_flow,
       nvl(cd.down_flow,0) down_flow,
       nvl(cd.free_num,0) free_num,
       nvl(cd.bill_num,0) bill_num,
       nvl(cd.free_flux,0) free_flux,
       nvl(cd.bill_flux,0) bill_flux,
       nvl(cd.free_dura,0) free_dura,
       nvl(cd.bill_dura,0) bill_dura,
       nvl(cd.total_fee,0) total_fee,
       nvl(e.ptp_sms_num,0) ptp_sms_num,
       nvl(e.sp_sms_num,0) sp_sms_num,
       nvl(e.ptp_sms_fee,0) ptp_sms_fee,
       nvl(e.sp_sms_fee,0) sp_sms_fee,
       nvl(f.total_dura,0) total_dura,
       nvl(f.toll_dura,0) toll_dura,
       nvl(f.roam_dura,0) roam_dura,
       nvl(f.total_times,0) total_times,
       nvl(f.total_l_times,0) total_l_times,
       nvl(f.total_nums,0) total_nums
  from contest1_training_1 a left outer join (select d.user_id,
                                                     sum(c.visit_cnt) visit_cnt,
                                                     sum(c.visit_dura) visit_dura,
                                                     sum(c.up_flow) up_flow,
                                                     sum(c.down_flow) down_flow,
                                                     sum(d.free_num) free_num,
                                                     sum(d.bill_num) bill_num,
                                                     sum(d.free_flux) free_flux,
                                                     sum(d.bill_flux) bill_flux,
                                                     sum(d.free_dura) free_dura,
                                                     sum(d.bill_dura) bill_dura,
                                                     sum(d.total_fee) total_fee
                                                from contest1_training_4 d left outer join contest1_training_3 c on(c.device_number=d.device_number)
                                            group by d.user_id) cd on (a.user_id=cd.user_id)
                             left outer join (select e.user_id,
                                                     sum(e.ptp_sms_num) ptp_sms_num,
                                                     sum(e.sp_sms_num) sp_sms_num,
                                                     sum(e.ptp_sms_fee) ptp_sms_fee,
                                                     sum(e.sp_sms_fee) sp_sms_fee
                                                from contest1_training_5 e
                                            group by e.user_id) e on a.user_id=e.user_id
                             left outer join (select f.user_id,
                                                     sum(f.total_dura) total_dura,
                                                     sum(f.toll_dura) toll_dura,
                                                     sum(f.roam_dura) roam_dura,
                                                     sum(f.total_times) total_times,
                                                     sum(f.total_l_times) total_l_times,
                                                     sum(f.total_nums) total_nums
                                                from contest1_training_6 f
                                            group by f.user_id) f on a.user_id=f.user_id;
                                            
create table contest1_for as 
select a.user_id,
       nvl(cd.visit_cnt,0) visit_cnt,
       nvl(cd.visit_dura,0) visit_dura,
       nvl(cd.up_flow,0) up_flow,
       nvl(cd.down_flow,0) down_flow,
       nvl(cd.free_num,0) free_num,
       nvl(cd.bill_num,0) bill_num,
       nvl(cd.free_flux,0) free_flux,
       nvl(cd.bill_flux,0) bill_flux,
       nvl(cd.free_dura,0) free_dura,
       nvl(cd.bill_dura,0) bill_dura,
       nvl(cd.total_fee,0) total_fee,
       nvl(e.ptp_sms_num,0) ptp_sms_num,
       nvl(e.sp_sms_num,0) sp_sms_num,
       nvl(e.ptp_sms_fee,0) ptp_sms_fee,
       nvl(e.sp_sms_fee,0) sp_sms_fee,
       nvl(f.total_dura,0) total_dura,
       nvl(f.toll_dura,0) toll_dura,
       nvl(f.roam_dura,0) roam_dura,
       nvl(f.total_times,0) total_times,
       nvl(f.total_l_times,0) total_l_times,
       nvl(f.total_nums,0) total_nums
  from contest1_forecast1 a left outer join (select d.user_id,
                                                     sum(c.visit_cnt) visit_cnt,
                                                     sum(c.visit_dura) visit_dura,
                                                     sum(c.up_flow) up_flow,
                                                     sum(c.down_flow) down_flow,
                                                     sum(d.free_num) free_num,
                                                     sum(d.bill_num) bill_num,
                                                     sum(d.free_flux) free_flux,
                                                     sum(d.bill_flux) bill_flux,
                                                     sum(d.free_dura) free_dura,
                                                     sum(d.bill_dura) bill_dura,
                                                     sum(d.total_fee) total_fee
                                                from contest1_forecast4 d left outer join contest1_forecast3 c on(c.device_number=d.device_number)
                                            group by d.user_id) cd on (a.user_id=cd.user_id)
                             left outer join (select e.user_id,
                                                     sum(e.ptp_sms_num) ptp_sms_num,
                                                     sum(e.sp_sms_num) sp_sms_num,
                                                     sum(e.ptp_sms_fee) ptp_sms_fee,
                                                     sum(e.sp_sms_fee) sp_sms_fee
                                                from contest1_forecast5 e
                                            group by e.user_id) e on a.user_id=e.user_id
                             left outer join (select f.user_id,
                                                     sum(f.total_dura) total_dura,
                                                     sum(f.toll_dura) toll_dura,
                                                     sum(f.roam_dura) roam_dura,
                                                     sum(f.total_times) total_times,
                                                     sum(f.total_l_times) total_l_times,
                                                     sum(f.total_nums) total_nums
                                                from contest1_forecast6 f
                                            group by f.user_id) f on a.user_id=f.user_id;
