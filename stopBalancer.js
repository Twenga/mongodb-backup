sh.stopBalancer();
while( db.locks.findOne({_id: "balancer"}).state ) {
       print("waiting..."); sleep(1000);
}
