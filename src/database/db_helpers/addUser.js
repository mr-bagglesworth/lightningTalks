// add user function
// - encrypt password, then add to the database
const db = require('../db_connection');
const bcrypt = require("bcryptjs");


const addUser = details => {

    // destructure details
    const { userName, name, email, password } = details;

    return new Promise((resolve, reject) => {
        // generate salt and hash on password
        bcrypt.genSalt(10, (err, salt) => {
            bcrypt.hash(password, salt, (hashError, hashResult) => {
            if (hashError) {
                reject(hashError);
            }
    
            // insert into users table
            else {
                const encryptedPwd = hashResult;
                db.query(
                "INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4)",
                [userName, name, email, encryptedPwd],
                (fail, success) => {
                    if (fail) reject(fail);
                    else resolve(success.rows);
                });
            }
    
    
            }); // end hash
        }); // end salt
    });

};

module.exports = addUser;