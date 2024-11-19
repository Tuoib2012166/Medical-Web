const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../db'); // Adjust the path as necessary

exports.login = async (req, res) => {
    console.log("Login request received", req.body);
    const selectUserSql = "SELECT * FROM users WHERE username = ?";

    const [selectUserResult,] = await db.query(selectUserSql, [req.body.username]);

    if (selectUserResult.length > 0) {
        const isValidPassword = bcrypt.compareSync(req.body.password, selectUserResult[0].password);
        if (isValidPassword) {
            console.log("Password is valid");

            // Sign token
            const token = jwt.sign(
                { id: selectUserResult[0].id, role: selectUserResult[0].role },
                process.env.JWT_SECRET,
                { expiresIn: +process.env.COOKIE_EXPIRE_IN }
            );

            res.cookie('token', token, {
                httpOnly: false,
                secure: false,
                maxAge: process.env.COOKIE_EXPIRE_IN * 1000,
                sameSite: 'lax'
            });

            res.setHeader('Access-Control-Allow-Credentials', 'true');

            const response = { message: "Đăng nhập thành công", token };

            if (selectUserResult[0].role === 'admin') {
                console.log("Admin login successful");
                response.redirect = "/admin";
            } else if (selectUserResult[0].role === 'doctor') {
                console.log("Doctor login successful");
                response.redirect = "/doctor";
            } else if (selectUserResult[0].role === 'patient') {
                console.log("Patient login successful");
                response.redirect = "/";
            }

            return res.json(response);
        } else {
            console.log("Invalid password");
            return res.json("Mật khẩu không đúng");
        }
    } else {
        console.log("Username does not exist");
        return res.json("Username không tồn tại");
    }
};

exports.register = async (req, res) => {
    console.log("Register request received", req.body);
    await db.query("START TRANSACTION");
    try {
        const { username, password, fullname, phone, address, birthYear, gender } = req.body;

        const checkUserSql = "SELECT * FROM users WHERE username = ?";
        const [rows,] = await db.execute(checkUserSql, [username]);

        if (rows.length > 0) {
            console.log("Username already exists");
            await db.query("ROLLBACK");
            return res.json("Username đã tồn tại");
        }

        const hashedPassword = bcrypt.hashSync(password, 10);

        const insertUserSql = "INSERT INTO users (username, password, role, status) VALUES (?, ?, 'patient', 1)";
        const [insertUserResult,] = await db.execute(insertUserSql, [username, hashedPassword]);

        const insertPatientSql = "INSERT INTO patients (user_id, fullname, phone, address, gender, birth_year) VALUES (?, ?, ?, ?, ?, ?)";
        await db.execute(insertPatientSql, [insertUserResult.insertId, fullname, phone, address, gender, birthYear]);

        await db.query("COMMIT");
        console.log("Registration successful");
        return res.json("Đăng ký thành công");
    } catch (error) {
        console.log("Registration failed", error);
        await db.query("ROLLBACK");
        return res.json("Có lỗi xảy ra. Vui lòng thử lại");
    }
};