var express = require('express');
var router = express.Router();
var db = require('../database/db')
const bcrypt = require('bcrypt')
const saltRounds = 10;
const jwt = require('node-jsonwebtoken');
const fs = require('fs');
const PRIVATE_KEY = fs.readFileSync('private-key.txt');
const maxAge = 3 *60 *60;
const multer = require('multer')

const {adminAuth} = require('./auth')

const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './public/Images')
    },
    filename: function(req, file, cb){
        cb(null, `${Date.now()}_${file.originalname}`)
    }
});

const upload = multer({ storage })
router.post('/upload', upload.single('file'), (req, res)=>{
    const file = req.file;
    if(!req.file){
        return res.status(400).send('No file uploaded.');
    }
    res.json({ filename: file.filename });

})

/* GET home page. */
router.get('/cate', (req, res) =>{
    let sql = `SELECT * FROM cate WHERE an_hien = 0`;
    db.query(sql, (err,data)=>{
        if(err) res.json({'Thong bao loi' : `${err}`})
            else res.json(data)
    })
})

router.get('/cate/name/:id', (req, res) =>{
    let id = req.params.id
    let sql = `SELECT name FROM cate WHERE id =${id}`;
    db.query(sql, (err,data)=>{
        if(err) res.json({'Thong bao loi' : `${err}`})
            else res.json(data[0])
    })
})


//Sản phẩm theo cate

router.get('/cate/:id',(req, res)=>{
    let id = req.params.id;
    let sql = `SELECT * FROM products WHERE cate_id = ${id} AND AN_HIEN = 0`
    db.query(sql, (err ,data)=>{
        if(err) res.json({"Thong bao": `${err}`})
            else res.json(data)
    })
})


// show sản phẩm
router.get('/sp', function(req, res, next) {
        let sql = `SELECT * FROM products WHERE an_hien = 0`
        db.query(sql, (err, data) =>{
            if(err) res.json({"Thong bao loi" : `${err}`})
                else res.json(data)
        })
});


router.get('/spnew', function(req, res, next) {
    let sql = `SELECT * FROM products WHERE an_hien = 0 ORDER BY ngay desc LiMIT 0, 10 `
    db.query(sql, (err, data) =>{
        if(err) res.json({"Thong bao loi" : `${err}`})
            else res.json(data)
    })
});

//Sản phẩm hot
router.get('/sphot', function(req, res, next) {
    let sql = `SELECT * FROM products WHERE an_hien =0 ORDER BY xem desc limit 0,10`
    db.query(sql, (err, data) =>{
        if(err) res.json({"Thong bao loi" : `${err}`})
            else res.json(data)
    })
});

// Sản phẩm theo cate_id
router.get('/showsp/:id', function(req, res, next) {
    let id = req.params.id;
    let sql = `SELECT * FROM products WHERE cate_id = ? AND an_hien = 0 LIMIT 5`
    db.query(sql, id,(err, data) =>{
        if(err) res.json({"Thong bao loi" : `${err}`})
            else res.json(data)
    })
});

router.get('/namecate/:id', function(req, res, next) {
    let id = req.params.id;
    let sql = `SELECT * FROM cate WHERE id = ? AND an_hien = 0`
    db.query(sql, id,(err, data) =>{
        if(err) res.json({"Thong bao loi" : `${err}`})
            else res.json(data)
    })
});


// Chi tiết sản phẩm
router.get('/sp/:id',(req, res)=>{
    let id = req.params.id;
    let sql = `SELECT * FROM products WHERE id = ${id} AND an_hien = 0 `
    db.query(sql, (err, data)=>{
        if(err) res.json({"thong bao" :`${err}`})
            else res.json(data[0])
    })
})

// Sản phẩm liên quan

router.get("/splq/:id", (req, res) =>{
    let id = req.params.id;
    let sql = `SELECT * FROM products WHERE cate_id = (SELECT cate_id FROM products WHERE id = ${id}) AND id !=${id} AND an_hien = 0 ORDER BY xem desc LIMIT 0, 5`;
    db.query(sql, (err,data) =>{
        if(err) res.json({"thong bao" :`${err}`})
            else res.json(data)
    })
})

// Bình luận
router.post("/binh_luan", (req,res) =>{
    let data = req.body;
    let sql = `INSERT INTO binh_luan SET ?`;
    console.log(data)
    db.query(sql, data, (err, data) =>{
        if(err) res.json({"thong bao" :`${err}`})
            else res.json({"thongbao": "Bạn đã bình luận thành công"})
    })
})

router.get("/show_binh_luan/:id", (req,res) =>{
    let id = req.params.id;
    let sql = `SELECT * FROM binh_luan WHERE id_sp = ?`;
    db.query(sql, id, (err, data)=>{
        if(err) res.json({"thong bao" :`${err}`})
            else res.json(data)
    })
})

router.post('/luudonhang', (req,res)=>{
    let data = req.body;
    let sql = ` INSERT INTO don_hang SET ?`;
    db.query(sql, data, (err, data) => {
        if(err) res.json({"id_dh": - 1 , "thongbao":"Loi", err})
            else{
        id_dh = data.insertId
        res.json({"id_dh": id_dh, "thongbao":"Da luu don hang"})        
    }
    })
})

router.post('/luugiohang', (req, res) =>{
    let data = req.body;
    let sql = `INSERT INTO don_hang_chi_tiet SET ?`;
    db.query(sql, data, (err, data) =>{
        if(err) res.json({"thongbao":'Loi', err})
            else res.json({"thongbao":"Da lu san pham vao db", "id_sp": data.id_sp})
    })
})

router.post('/tangluotxem/:id', (req, res) => {
    let id = req.params.id;
    let sql = `UPDATE products SET xem = xem + 1 WHERE id = ${id}`;
    db.query(sql, (err, result) => {
        if (err) {
            return  res.json({ "thongbao": 'Lỗi', err });
        } else {
            res.json({ "thongbao": 'Đã tăng lượt xem' });
        }
    });
});

// San pham yeu thich

router.post('/likepr/:id', (req, res) => {
    let id = req.params.id;
    let sql = 'SELECT `like` FROM products  WHERE id = ?';

    db.query(sql, [id], (err, data) => {
        if (err) {
         return  res.json({ "thongbao": "Loi", "error": err.message });
        } 

        let like = data[0].like;
        const chuyendoilike = like === 1 ? 0 : 1;

        let sql1 = "UPDATE products SET `like` = ? WHERE id = ?";
        db.query(sql1, [chuyendoilike, id], (err, data) =>{
            if(err) return res.json({"thongbao":"Loi"}, err)
                res.json(chuyendoilike === 1 ? "Ban da like san pham" : " Ban da huy like"); return;
        })
    });

});

router.get('/showPrLike', (req,res)=>{
    let sql ="SELECT * FROM products WHERE `like` = 1";
    db.query(sql, (err, data) =>{
        if(err) return res.json({"thongbao":'Loi'}, err);
        return res.json(data)
    })
});

// Đăng kí
router.post('/register', (req, res) => {
    let data = req.body;

    bcrypt.hash(data.password, saltRounds, (err, hash) => {
        if (err) {
            return res.status(500).json({ "thongbao": "Lỗi mã hóa mật khẩu", err });
        }
        data.password = hash;

        let sql = `INSERT INTO user SET ?`;
        db.query(sql, data, (err, result) => {
            if (err) {
                return res.status(500).json({ "thongbao": "Lỗi khi thêm người dùng", err });
            }
            res.json({ "thongbao": "Bạn đã tạo tài khoản thành công" });
        });
    });
});

// Đăng nhập
router.post('/login', (req, res) =>{
    let email = req.body.email;
    let password = req.body.password;

    let sql = `SELECT * FROM user WHERE email = ?`;
    db.query(sql, [email], (err,data)=>{
        if (err) {
            return res.status(500).json({"thongbao": 'Lỗi hệ thống', err});
        }
        if(data.length > 0){
            const userInfo = data[0];
            bcrypt.compare(password, userInfo.password, (err, data)=>{
                if(err){
                    return res.status(500).json({"thongbao": 'Lỗi khi so sánh mật khẩu', err});
                }

                if(data){
                    const jwtBearToken = jwt.sign(
                        {id: userInfo.id, role: userInfo.role}, PRIVATE_KEY, {algorithm: "RS256", expiresIn: maxAge, subject: userInfo.id.toString()}
                    );
                    return res.status(200).json({token: jwtBearToken, expiresIn: maxAge, userInfo: userInfo});
                }else{
                    return res.status(401).json({"thongbao":'Đăng nhập thất bại'})
                }

            })

        }else{
            return res.status(401).json({"thongbao": "Người dùng không tồn tại"});
        }

    })

    

})




// Admin Admin Admin

//Lấy sản phẩm và làm pageging
router.get('/admin/sp', adminAuth, async(req, res) =>{
    let page = Number(req.query.page === undefined ? 1 : req.query.page);
    let limit = Number(req.query.limit === undefined ? 5 : req.query.limit);
    let startrow = (page - 1)* limit;

    let sql = `SELECT * FROM products ORDER BY id DESC LIMIT ?, ?`;
    db.query(sql,[startrow, limit] ,(err, data)=>{
        if(err) res.json({'thongbao':'Lỗi lấy sản phẩm'}, err);
        res.json(data)
    })
})

router.get("/admin/sp/dem", adminAuth, async (req, res) =>{
    let sql = `SELECT COUNT(*) AS total FROM products`;
    db.query(sql, (err, data) =>{
        if(err) res.json({"thongbao":"Loi", err}); 
            else res.json( {total : data[0].total}) 
    })
})


router.post('/admin/spAH/:id', adminAuth, async (req, res) =>{
    let id = req.params.id;
    let data = req.body.an_hien;
    let sql = `UPDATE products SET an_hien = ? WHERE id =? `
    db.query(sql, [data, id],(err, data)=>{
        if(err) res.json({'thongbao':'Lỗi '}, err)
            res.json({"thongbao": "Thành công"})
    })
})


// ADD PR

router.post("/admin/sp",  adminAuth, async (req,res) =>{
    let {name, price, img, quantity, cate_id,  description, ngay } = req.body;
    const anh = `./public/Images/${img}`;
    // console.log(name, price, anh, quantity, cate_id,  description, ngay)
    let sql = `INSERT INTO products (name, price, img, quantity, cate_id, description, ngay) VALUES (?,?,?,?,?,?,?)`;
    db.query(sql, [name, price, anh, quantity, cate_id,  description, ngay], (err, data)=>{
        if(err) res.json({'thongbao':'Lỗi'}, err)
            res.json({'thongbao':'Bạn đã tạo sản phẩm thành công'})
    })
})

// UPdate pr

router.get('/admin/sp/:id', adminAuth, async (req,res)=>{
    let id = req.params.id;
    let sql =`SELECT *FROM products WHERE id = ?`;
    db.query(sql, id,(err, data)=>{
        if(err) res.json({"thongbao":"Loi"}, err)
            res.json(data[0])
    })
})

router.put("/admin/sp/:id", adminAuth, async (req, res) => {
    let id = req.params.id;
    let { name, price, img, quantity, cate_id, description, an_hien } = req.body;
    const anh = `./public/Images/${img}`;
    // console.log(name, price, anh, quantity, cate_id, description, an_hien);

    let sql = `UPDATE products SET name = ?, price = ?, img = ?, quantity = ?, cate_id = ?, description = ?, an_hien = ? WHERE id = ?`;
    db.query(sql, [name, price, anh, quantity, cate_id, description, an_hien, id], (err, data) => {
        if (err) {
            res.json({ 'thongbao': 'Lỗi' }, err);
        } else {
            res.json({ 'thongbao': 'Bạn đã cập nhật sản phẩm thành công' });
        }
    });
});

// Delete pr
router.delete('/admin/sp/:id', adminAuth, async (req,res)=>{
    let id = req.params.id;
    let sql = `DELETE  FROM products WHERE id =?`;
    db.query(sql, id, (err,data)=>{
        if(err) res.json({"thongbao":"Loi"}, err)
            res.json({'thongbao':'Da xoa san pham'})
    })
})

// Cate


//Lấy sản phẩm và làm pageging
router.get('/admin/cate', adminAuth, async (req, res) =>{
    let page = Number(req.query.page === undefined ? 1 : req.query.page);
    let limit = Number(req.query.limit === undefined ? 4 : req.query.limit);
    let startrow = (page - 1)* limit;

    let sql = `SELECT * FROM cate ORDER BY id DESC LIMIT ?, ?`;
    db.query(sql,[startrow, limit] ,(err, data)=>{
        if(err) res.json({'thongbao':'Lỗi lấy danh mục'}, err);
        res.json(data)
    })
})

router.get("/admin/cate/dem" , adminAuth, async (req, res) =>{
    let sql = `SELECT COUNT(*) AS total FROM cate`;
    db.query(sql, (err, data) =>{
        if(err) res.json({"thongbao":"Loi", err}); 
            else res.json( {total : data[0].total}) 
    })
})


router.post('/admin/cateAH/:id', adminAuth, async (req, res) =>{
    let id = req.params.id;
    let data = req.body.an_hien;
    let sql = `UPDATE cate SET an_hien = ? WHERE id =? `
    db.query(sql, [data, id],(err, data)=>{
        if(err) res.json({'thongbao':'Lỗi '}, err)
            res.json({"thongbao": "Thành công"})
    })
})

// Add Cate
router.post("/admin/cate", adminAuth, async (req,res) =>{
    let {name, img, ngay } = req.body;
    const anh = `./public/Images/${img}`;
    console.log(name, anh, ngay)
    let sql = `INSERT INTO cate (name, img, ngay) VALUES (?,?,?)`;
    db.query(sql, [name, anh, ngay], (err, data)=>{
        if(err) res.json({'thongbao':'Lỗi'}, err)
            res.json({'thongbao':'Bạn đã tạo danh mục thành công'})
    })
})

// UPdate pr

router.get('/admin/cate/:id', adminAuth, async (req,res)=>{
    let id = req.params.id;
    let sql =`SELECT * FROM cate WHERE id = ?`;
    db.query(sql, id,(err, data)=>{
        if(err) res.json({"thongbao":"Loi"}, err)
            res.json(data[0])
    })
})

router.put("/admin/cate/:id", adminAuth, async (req, res) => {
    let id = req.params.id;
    let { name, img, an_hien } = req.body;
    const anh = `./public/Images/${img}`;
    // console.log(name, anh,  an_hien);

    let sql = `UPDATE cate SET name = ?, img = ?, an_hien = ? WHERE id = ?`;
    db.query(sql, [name, anh, an_hien, id], (err, data) => {
        if (err) {
            res.json({ 'thongbao': 'Lỗi' }, err);
        } else {
            res.json({ 'thongbao': 'Bạn đã cập nhật sản phẩm thành công' });
        }
    });
});

// Delete pr
router.delete('/admin/cate/:id', adminAuth, async (req,res)=>{
    let id = req.params.id;
    let sql = `DELETE  FROM cate WHERE id =?`;
    db.query(sql, id, (err,data)=>{
        if(err) res.json({"thongbao":"Loi"}, err)
            res.json({'thongbao':'Da xoa san pham'})
    })
})


//Lay user

router.get('/user/:id', (req, res) => {
    let id = req.params.id;

    let sql = `SELECT id, password FROM user WHERE id = ?`;
    db.query(sql, [id], (err, data) => {
        if (err) {
            return res.status(500).json({ "thongbao": "Lỗi", err });
        }
        res.json(data[0]);
    });
});

// Đổi pass

router.put('/doipass/:id',(req, res) => {
    let id = req.params.id;
    let { password_old, password_new } = req.body;

    let sql = `SELECT password FROM user WHERE id = ?`;
    db.query(sql, [id], (err, data) => {
        if (err) {
            return res.status(500).json({ "thongbao": "Lỗi", err });
        }

        bcrypt.compare(password_old, data[0].password, (err, result) => {
            if (err) {
                return res.status(500).json({ "thongbao": "Lỗi so sánh mật khẩu", err });
            }
            if (!result) {
                return res.status(400).json({ "thongbao": "Mật khẩu hiện tại không đúng" });
            }
            bcrypt.hash(password_new, saltRounds, (err, hash) => {
                if (err) {
                    return res.status(500).json({ "thongbao": "Lỗi mã hóa mật khẩu", err });
                }

                let updateSql = `UPDATE user SET password = ? WHERE id = ?`;
                db.query(updateSql, [hash, id], (err) => {
                    if (err) {
                        return res.status(500).json({ "thongbao": "Lỗi cập nhật mật khẩu", err });
                    }
                    res.json({ "thongbao": "Bạn đã đổi mật khẩu thành công" });
                });
            });
        });
    });
});


// Quản lí tài khoản

router.get('/user', adminAuth, (req, res) =>{
    let sql = `SELECT * FROM user`;
    db.query(sql, (err, data)=>{
        if(err) res.json({'thongbao':'Loi lay user'});
        res.json(data)
    })
})

router.get('/admin/user', adminAuth,(req,res)=>{
    let page = Number(req.query.page === undefined ? 1 : req.query.page);
    let limit = Number(req.query.limit === undefined ? 4 : req.query.limit);
    let startrow = (page - 1) * limit;
    let sql = `SELECT * FROM user ORDER BY id DESC LIMIT ?, ?`;
    db.query(sql, [startrow, limit],(err, data)=>{
        if(err) res.json({'thongbao':'Loi lay user'});
        res.json(data)
    })
})

router.get('/admin/user/dem', adminAuth,(req, res) =>{
    let sql = `SELECT COUNT(*) AS total FROM user`;
    db.query(sql, (err, data)=>{
        if(err) res.json({'thongbao':'Loi', err})
            else res.json({total: data[0].total})
    })
})


router.post('/admin/khoauser/:id', adminAuth, async (req, res) =>{
    let id = req.params.id;
    let data = req.body.role;
    let sql = `UPDATE user SET role = ? WHERE id = ? `
    db.query(sql, [data, id],(err, data)=>{
        if(err) res.json({'thongbao':'Lỗi '}, err)
            res.json({"thongbao": "Thành công"})
    })
})

router.delete('/admin/user/:id', adminAuth,(req, res) =>{
    let id = req.params.id;
    let sql = `DELETE FROM user WHERE id = ${id}`;
    db.query(sql, (err, data)=>{
        if(err) res.json({'thongbao':'Lỗi '}, err)
            res.json({"thongbao": "Xoá thành công"})
    })
})

module.exports = router;
