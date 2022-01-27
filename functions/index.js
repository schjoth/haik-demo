const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp();

// If you want to add multiple endpoints one should install express and use a validation function
exports.getMyTrips = functions.https.onRequest(async (req, res) => {
  if ((!req.headers.authorization || !req.headers.authorization.startsWith('Bearer ')) &&
      !(req.cookies && req.cookies.__session)) {
    functions.logger.error(
      'No Firebase ID token was passed as a Bearer token in the Authorization header.',
      'Make sure you authorize your request by providing the following HTTP header:',
      'Authorization: Bearer <Firebase ID Token>',
      'or by passing a "__session" cookie.'
    );
    res.status(403).send('Unauthorized');
    return;
  }

  let idToken;
  if (req.headers.authorization && req.headers.authorization.startsWith('Bearer ')) {
    functions.logger.log('Found "Authorization" header');
    // Read the ID Token from the Authorization header.
    idToken = req.headers.authorization.split('Bearer ')[1];
  } else if(req.cookies) {
    functions.logger.log('Found "__session" cookie');
    // Read the ID Token from cookie.
    idToken = req.cookies.__session;
  } else {
    // No cookie
    res.status(403).send('Unauthorized');
    return;
  }

  try {
      functions.logger.log('Token', idToken);
    const decodedIdToken = await admin.auth().verifyIdToken(idToken);
    functions.logger.log('ID Token correctly decoded', decodedIdToken);
    req.user = decodedIdToken;

    res.json({
        result: "Logged in"
    })
  } catch (error) {
    functions.logger.error('Error while verifying Firebase ID token:', error);
    res.status(403).send('Unauthorized');
    return;
  }
});
