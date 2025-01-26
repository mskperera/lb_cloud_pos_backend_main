const crypto = require("crypto");

exports.encryptPassword = (password, salt) => {
    if (!password) return "";
  
    try {
      return crypto.createHmac("sha1", salt).update(password).digest("hex");
    } catch (err) {
      return err;
    }
  };
