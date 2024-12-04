const express = require("express");
 const router = express.Router();

const { logout, verifySignUp_ctrl, completeSignup_ctrl, login_ctrl, resetForgotPasswordVerify_ctrl, resetForgotPassword_ctrl, crpLogin_ctrl } = require("../controllers/auth");

 router.post("/auth/verify-signup", verifySignUp_ctrl);
 router.post("/auth/complete-signup", completeSignup_ctrl);
 router.post("/auth/login", login_ctrl);
 router.post("/auth/logout", logout);
 router.post("/auth/reset-forgot-password-verify", resetForgotPasswordVerify_ctrl);
 router.post("/auth/reset-forgot-password", resetForgotPassword_ctrl);

 router.post("/auth/crpLogin_ctrl", crpLogin_ctrl);

module.exports = router;