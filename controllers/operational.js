
const {
  backupDatabaseTo_live_db_dumps_srv,
  cleanupIncompleteTenancySetups_srv,
  removeTenancySetup_srv,
  restoreDatabase_srv,
  removeDBUserAccount_srv,
  createUserAccountForDb_srv,
  setupTenantToCustomServer_srv,
  getConnectionDetailsByTenantId_srv
} = require("../services/operational");

exports.restoreDatabase_ctrl = async (req, res) => {
  const { hostName, dbName, dumpFile } = req.body;

  if (!hostName) {
    return res.status(422).json({
      error: "hostName is Required",
    });
  }

  if (!dbName) {
    return res.status(422).json({
      error: "dbName is Required",
    });
  }
  if (!dumpFile) {
    return res.status(422).json({
      error: "dumpFile is Required",
    });
  }

  try {
   const restoreDatabaseRes= await restoreDatabase_srv(hostName, dbName, dumpFile);
   if(restoreDatabaseRes.exception){
    return res.status(400).json(restoreDatabaseRes);
  }

    res.json(restoreDatabaseRes);

  } catch (err) {
    console.log("restoreDatabase_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};

exports.backupDatabaseTo_live_db_dumps_ctrl = async (req, res) => {
  const { hostName, dbName, dumpFilename } = req.body;

  if (!hostName) {
    return res.status(422).json({
      error: "hostName is Required",
    });
  }

  if (!dbName) {
    return res.status(422).json({
      error: "dbName is Required",
    });
  }

  try {
   const backupMySQLDatabaseRes= await backupDatabaseTo_live_db_dumps_srv(hostName, dbName, dumpFilename);
   if(backupMySQLDatabaseRes.exception){
    return res.status(400).json(backupMySQLDatabaseRes);
  }
    res.json(backupMySQLDatabaseRes);

  } catch (err) {
    console.log("backupDatabaseTo_live_db_dumps_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};

exports.removeDBUserAccount_ctrl = async (req, res) => {
  const { dbUsername,hostName } = req.body;

  if (!dbUsername) {
    return res.status(422).json({
      error: "dbUsername is Required",
    });
  }
  if (!hostName) {
    return res.status(422).json({
      error: "hostName is Required",
    });
  }

  try {
  const removeDBUserAccountRes=await removeDBUserAccount_srv(dbUsername,hostName);

  if(removeDBUserAccountRes.exception){
    return res.status(400).json(removeDBUserAccountRes);
  }

  res.status(200).json(removeDBUserAccountRes);

  } catch (err) {
    //res.status(400).json({message: err.message});
    console.log("removeDBUserAccount_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};

exports.initializeDbAndConnection_ctrl = async (req, res) => {
  const { displayName,accEmail, accPassword,hostName } = req.body;
  
  if (!displayName) {
    return res.status(422).json({
      error: "displayName is Required",
    });
  }

  if (!hostName) {
    return res.status(422).json({
      error: "hostName is Required",
    });
  }
  
  if (!accEmail) {
    return res.status(422).json({
      error: "accEmail is Required",
    });
  }

  if (!accPassword) {
    return res.status(422).json({
      error: "accPassword is Required",
    });
  }

  try {

    const setupTenantRes= await setupTenantToCustomServer_srv(hostName,accEmail, accPassword,displayName);

   if(setupTenantRes.exception){
    return res.status(400).json(setupTenantRes);
  }
    res.status(200).json(setupTenantRes);
  } catch (err) {
    console.log("initializeDbAndConnection_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};

exports.removeTenancySetup_ctrl = async (req, res) => {
  const { tenantId } = req.body;

  if (!tenantId) {
    return res.status(422).json({
      error: "tenantId is Required",
    });
  }

  try {
  const removeTenancySetupRes= await removeTenancySetup_srv(tenantId);
    if(removeTenancySetupRes.exception){
      return res.status(400).json(removeTenancySetupRes);
    }

    res.status(200).json(removeTenancySetupRes);

  } catch (err) {
    console.log("removeTenancySetup_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};


exports.cleanupIncompleteTenancySetups_ctrl = async (req, res) => {
  const { tenantId } = req.body;

  if (!tenantId) {
    return res.status(422).json({
      error: "tenantId is Required",
    });
  }

  try {

  const clnupRes=await cleanupIncompleteTenancySetups_srv(tenantId);

  if(clnupRes.exception){
    return res.status(400).json(clnupRes);
  }

  res.status(200).json(clnupRes);

  } catch (err) {
    console.log("cleanupIncompleteTenancySetups_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};

exports.createUserAccountForDb_ctrl = async (req, res) => {
  const { dbUsername,dbPassword,dbName,hostName } = req.body;

  if (!dbUsername) {
    return res.status(422).json({
      error: "dbUsername is Required",
    });
  }
  if (!dbPassword) {
    return res.status(422).json({
      error: "dbPassword is Required",
    });
  }
  if (!dbName) {
    return res.status(422).json({
      error: "dbName is Required",
    });
  }
  if (!hostName) {
    return res.status(422).json({
      error: "hostName is Required",
    });
  }

  try {
  const reateUserAccountForDbRes= await createUserAccountForDb_srv(dbUsername,dbPassword,dbName,hostName);
    if(reateUserAccountForDbRes.exception){
      return res.status(400).json(reateUserAccountForDbRes);
    }

    res.status(200).json(reateUserAccountForDbRes);

  } catch (err) {
    //res.status(400).json({message: err.message});
    console.log("createUserAccountForDb_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};

exports.getConnectionDetailsByTenantId_ctrl = async (req, res) => {
  const { tenantId } = req.query;

  if (!tenantId) {
    return res.status(422).json({
      error: "tenantId is Required",
    });
  }

  try {
  const result= await getConnectionDetailsByTenantId_srv(tenantId);
    if(result.exception){
      return res.status(400).json(result);
    }

    res.status(200).json(result);

  } catch (err) {
    //res.status(400).json({message: err.message});
    console.log("createUserAccountForDb_ctrl() -> error: ", err);
    res.status(500).json({error:'Something is wrong, please contact the service provider.'});
  }
};
