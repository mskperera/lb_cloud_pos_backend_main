const {
  verifySignUp_srv,
  completeSignup_srv,
  login_srv,
  resetForgotPasswordVerify_srv,
  resetForgotPassword_srv,
  crpLogin_srv,
} = require("../services/auth");

exports.verifySignUp_ctrl = async (req, res) => {
  const { userName, password, displayName } = req.body;

  try {
    if (!userName) {
      return res.status(422).json({
        error: "User Name is Required",
      });
    }

    if (!password) {
      return res.status(422).json({
        error: "Password is Required",
      });
    }
    if (!displayName) {
      return res.status(422).json({
        error: "displayName is Required",
      });
    }

    const verifySignupRes = await verifySignUp_srv(
      userName,
      password,
      displayName
    );
    if (verifySignupRes.exception) {
      return res.status(400).json(verifySignupRes);
    }

    res.status(200).json(verifySignupRes);
  } catch (err) {
    console.log("verifySignUp() -> error: ", err);
    res
      .status(500)
      .json({
        error: "Something is wrong, please contact the service provider.",
      });
  }
};

exports.completeSignup_ctrl = async (req, res) => {
  const { userName, password, verificationCode } = req.body;

  try {
    if (!userName) {
      return res.status(422).json({
        error: "userName is Required",
      });
    }

    if (!password) {
      return res.status(422).json({
        error: "password is Required",
      });
    }

    if (!verificationCode) {
      return res.status(422).json({
        error: "verificationCode is Required",
      });
    }

    const comopleteSignupRes = await completeSignup_srv(
      userName,
      password,
      verificationCode
    );

    if (comopleteSignupRes.exception) {
      return res.status(400).json(comopleteSignupRes);
    }
    res.status(200).json(comopleteSignupRes);
  } catch (err) {
    console.log("completeSignup_ctrl() -> error: ", err);
    res
      .status(500)
      .json({
        error: "Something is wrong, please contact the service provider.",
      });
  }
};



exports.login_ctrl = async (req, res) => {
  const { userName, password } = req.body;

  try {
    if (!userName) {
      return res.status(422).json({
        error: "User Name is Required",
      });
    }

    if (!password) {
      return res.status(422).json({
        error: "Password is Required",
      });
    }

    const loginRes = await login_srv(userName, password);

    console.log('loginRes',loginRes);
    if (loginRes.exception) {
      return res.status(401).json(loginRes);
    }

    res.cookie("accessToken", loginRes.accessToken, {
      httpOnly: true,
      expiresIn: "1d",
    });

  const {uName,email,displayName,profilePic}=  loginRes;
    res.status(200).json({ accessToken: loginRes.accessToken,uName,email,displayName,profilePic });

    //res.status(200).json(loginRes );
  } catch (error) {
    console.log("login_ctrl() -> error: ", error);
    res
      .status(500)
      .json({
        error: "Something is wrong, please contact the service provider.",
      });
  }
};

exports.resetForgotPasswordVerify_ctrl = async (req, res) => {
  const { userName } = req.body;

  try {
    if (!userName) {
      return res.status(422).json({
        error: "User Name is Required",
      });
    }

    const resetForgotPassVerify = await resetForgotPasswordVerify_srv(userName);
    if (resetForgotPassVerify.exception) {
      return res.status(400).json(resetForgotPassVerify);
    }

    res.status(200).json(resetForgotPassVerify);
  } catch (error) {
    console.log("resetForgotPasswordVerify_ctrl() -> error: ", error);
    res
      .status(500)
      .json({
        error: "Something is wrong, please contact the service provider.",
      });
  }
};

exports.resetForgotPassword_ctrl = async (req, res) => {
  const { userName, password, verificationCode } = req.body;

  try {
    const resetForgotPassRes = await resetForgotPassword_srv(
      userName,
      password,
      verificationCode
    );
    if (resetForgotPassRes.exception) {
      return res.status(400).json(resetForgotPassRes);
    }

    res.status(200).json(resetForgotPassRes);
  } catch (error) {
    console.log("resetForgotPassword_ctrl() -> error: ", error);
    res.status(500).json({
      error: "Something is wrong, please contact the service provider.",
    });
  }
};

exports.logout = (req, res) => {
  res.clearCookie("accessToken");
  res.sendStatus(204);
};




exports.crpLogin_ctrl = async (req, res) => {
  const { userName, password } = req.body;

  try {
    if (!userName) {
      return res.status(422).json({
        error: "User Name is Required",
      });
    }

    if (!password) {
      return res.status(422).json({
        error: "Password is Required",
      });
    }

    const loginRes = await crpLogin_srv(userName, password);

    console.log('loginRes',loginRes);
    if (loginRes.exception) {
      return res.status(401).json(loginRes);
    }

    res.cookie("accessToken", loginRes.accessToken, {
      httpOnly: true,
      expiresIn: "100d",
    });
    res.status(200).json(loginRes);

    //res.status(200).json(loginRes );
  } catch (error) {
    console.log("login_ctrl() -> error: ", error);
    res
      .status(500)
      .json({
        error: "Something is wrong, please contact the service provider.",
      });
  }
};