
const apiProtectMiddleware = (req, res, next) => {
    const clientKey = req.headers["x-api-key"];
    console.log('apiProtectMiddleware',clientKey)
    if(!clientKey){
        return res.status(400).json({ error: "api key not found" });
    }
   
    if (clientKey !==process.env.OPERATIONAL_API_KEY) {
      return res.status(403).json({ error: "Unauthorized access" });
    }
  
    next();
  };
  
  module.exports={apiProtectMiddleware}