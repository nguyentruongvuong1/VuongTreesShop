import { useState, useEffect } from "react"
import { PaginationControl } from "react-bootstrap-pagination-control"
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';
import { useSelector } from "react-redux";
function AdminUser() {

    const [user, setuser] = useState([]);
    const [page, setpage] = useState(1);
    const [totalrow, settotalrow] = useState(0);
    const limit = 4;
    const [ search, setsearch] = useState('')
    const [ Alluser, setAlluser] = useState([])
    const [ userfilter, setuserfilter] = useState([])

    const token = useSelector(state => state.auth.token)
    
    useEffect(() =>{
      let opt = {
        method: 'GET',
        headers: {
            "Content-Type": 'application/json',
            'Authorization': 'Bearer ' + token
        }
    };

        fetch(`http://localhost:3000/admin/user/dem`,opt).then(res => res.json()).then(data => {
            if(data.total !== undefined){
                settotalrow(data.total)
            }else{
                console.error("Invalid data structure for total rows", data);
            }
        })
        fetch(`http://localhost:3000/admin/user?page=${page}&limit=${limit}`, opt).then(res => res.json()).then(data => setuser(data));
        fetch(`http://localhost:3000/user`, opt).then(res => res.json()).then(data => setAlluser(data));

    }, [page, token])


    const onchangeSearch = (e) =>{
      setsearch(e.target.value);
    }

    useEffect(() =>{
      if(search === ''){
        setuserfilter(user)
      }else{
        const Filteruser = Alluser.filter(user => user.username.toLowerCase().includes(search.toLowerCase()))
        setuserfilter(Filteruser)
      }
    }, [Alluser, user, search])

  const DeleteUser = (id) =>{
    const hoi = window.confirm('Bạn có chắc muốn xóa tài khoản này không');
    if(hoi){
      let opt = {method:'DELETE', headers:{'Content-Type':'application/json' , 'Authorization': 'Bearer ' + token }}
      fetch(`http://localhost:3000/admin/user/${id}`,opt).then(res => res.json()).then(data =>{
        alert('Bạn đã xóa tài khoản thành công')
        window.location.reload();
      })
    }else window.location.reload();
      
      
  }

  const AHpr = (id, value) =>{
    let url = `http://localhost:3000/admin/khoauser/${id}`
    let tt = {role: value};
    let opt = {method: 'POST', body:JSON.stringify(tt), headers:{"Content-Type":'application/json', 'Authorization': 'Bearer ' + token}}

    fetch(url, opt).then(res => res.json()).then(data =>{
      if(value === 2){
        alert("Bạn đã  khóa tài khoản")
        window.location.reload()
      }else{
        alert("Bạn mở khóa tài khoản")
        window.location.reload()

      }
    })

  }

    return(
      
<div>
  
<div className="link_dashboard">
    <p> <strong>Home </strong></p>
    <p>/</p>
    <p style={{color: "#00791c"}}><Link href="#" to={'/admin'}> Dashboard</Link></p>
    <p>/</p>
    <p ><Link href="#" to={'/admin/user'}> Tài khoản</Link></p>
</div>
  
  <div className="search">
        <input
            type="text"
            value={search}
            onChange={onchangeSearch} placeholder="Tìm kiếm..."
           
/>
        <FontAwesomeIcon icon={faMagnifyingGlass} className="icon_search" />
  </div>
  <div>
    <table className="table-products">
      <tbody>
        <tr>
          <th>Tên tài khoản</th>
          <th>email</th>
          <th>Chức vụ</th>
          <th>Khóa tài khoản</th>
          <th>Xóa tài khoản</th>
        </tr>
        {
          userfilter.length > 0 ?(
            userfilter.map(user =>
              <tr key={user.id}>
                <td>{user.username}</td>
                <td>{user.email}</td>
                <td>{user.role === 0 ? 'Admin' : 'Người dùng'}</td>
                <td>
                    <select className="an-hien-select" value={user.role} onChange={(e) => AHpr(user.id, parseInt(e.target.value))}>
                    <option className="an-hien-option" value={0}>Bình thường</option>
                    <option className="an-hien-option" value={2}>Đang Khóa</option>
                     </select>
                              </td>
                <td>
                  <button className="btn-delete" onClick={() => DeleteUser(user.id)} >Xóa</button>
                </td>
              </tr>
            )
          ):(
          <tr><td colSpan="8">Không tìm thấy user nào.</td></tr>
          )
        }
      </tbody>
    </table>
  </div>
  <PaginationControl page={page} between={1} limit={limit} ellipsis={1} total={totalrow} changePage={(page) => setpage(page)} />
</div>

      
    )
}

export default AdminUser