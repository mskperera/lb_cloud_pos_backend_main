const express = require("express");
const { initializeDbAndConnection_ctrl, cleanupIncompleteTenancySetups_ctrl,
     removeTenancySetup_ctrl, restoreDatabase_ctrl, backupDatabaseTo_live_db_dumps_ctrl,
      removeDBUserAccount_ctrl, createUserAccountForDb_ctrl, 
      getConnectionDetailsByTenantId_ctrl} = require("../controllers/operational");
const { apiProtectMiddleware } = require("../middlewares/apiProtect");
 const router = express.Router();

 router.post("/operational/restoreDatabase", restoreDatabase_ctrl);
 router.post("/operational/backupDatabase-to-live_db_dumps", backupDatabaseTo_live_db_dumps_ctrl);
 router.post("/operational/initializeDbAndConnection", initializeDbAndConnection_ctrl);
 router.post("/operational/cleanupIncompleteTenancySetups", cleanupIncompleteTenancySetups_ctrl);
 router.post("/operational/remove-dbuser-account", removeDBUserAccount_ctrl);
 router.post("/operational/removeTenancySetup", removeTenancySetup_ctrl);
 router.post("/operational/create-user-account-for-db", createUserAccountForDb_ctrl);
 
 router.get("/operational/getConnectionDetailsByTenantId",apiProtectMiddleware, getConnectionDetailsByTenantId_ctrl);

module.exports = router;