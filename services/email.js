const { sendEmail }= require('../apis/email');


 const sendAccountRegistrationVerification = async (recipientEmail,verificationCode,recipientName) => {
    try {
  
       // const recipientEmail="cyberknights1@gmail.com";
        const subject="Verify Your Account";
        const isHtmlBody=true;
        const messageBody=`<!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${subject}</title>
        </head>
        <body>
            <p>Hello ${recipientName},</p>
        
            <p>We have received a request to verify your account. To complete the verification process, please use the following code:</p>
            
            <h2>${verificationCode}</h2>
            
            <p>If you didn't request this verification, please ignore this email. Your account will remain secure.</p>
            
            <p>Thank you for using our service.</p>
            
            <p>Best regards,<br>Your Company Name</p>
        </body>
        </html>`;
      
     await sendEmail(recipientEmail,subject,isHtmlBody,messageBody);
      
    } catch (err) {
      return err;
    }
  };

  const sendAccountPasswordResetVerification = async (recipientEmail,verificationCode,recipientName) => {
    try {
  
       // const recipientEmail="cyberknights1@gmail.com";
        const subject="Password Reset Request";
        const isHtmlBody=true;
        const messageBody=`<!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${subject}</title>
        </head>
        <body>
            <p>Hello ${recipientName},</p>
        
            We have received a request to reset your password for your account on our website.
            If you did not make this request, please ignore this email. If you did make this request,
             please follow the steps below to verify your identity and create a new password.</p>
            
             <ol>
             <li>Enter this verification code in the password reset page: <span style="font-weight:bold; font-size:20px">${verificationCode}</span>. This code will expire in 15 minutes.</li>
              <li>Choose a new password that is at least 8 characters long and contains a mix of letters, numbers, and symbols.</li>
              <li>Confirm your new password and save the changes.</li>
            </ol>
            
            <p>If you didn't request this verification, please ignore this email. Your account will remain secure.</p>
            
            <p>Thank you for using our service.</p>
            
            <p>Best regards,<br>Your Company Name</p>
        </body>
        </html>`;
      
     await sendEmail(recipientEmail,subject,isHtmlBody,messageBody);
      
    } catch (err) {
      return err;
    }
  };

  module.exports={sendAccountRegistrationVerification,sendAccountPasswordResetVerification}