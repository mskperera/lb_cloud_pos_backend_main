const axios=require('axios');
const API = process.env.MESSAGE_SERVICE_URL;

 const sendEmail = async (recipientEmail,subject,isHtmlBody,messageBody) => {
  try {
  
    const data={recipientEmail,subject,isHtmlBody,messageBody}
    console.log('eererereeeeeeeeeeeeeee',API)
    return await axios
      .post(`http://localhost:5000/api/notification/email/send`, data, {
        headers: {
          'Content-Type': 'application/json',
         // "authorization":`Bearer ${token}`
        },
      })
      .then((res) => {
        return res;
      })
      .catch((err) => {
        return err.response;
      });
  } catch (err) {
    console.log('sendEmail()-> error:',err)
    return err;
  }
};

module.exports={sendEmail}