let users = [
    {
        'email': 'ilyas@gmail.com',
        'password': '123',
        'fullName': 'Ilyas Zhuanyshev',
        'country': 'Kazakhstan',
        'birthdate': '1990-03-22'
    }
];

function registerInit() {
    document.querySelector('.btn').addEventListener('click', register);
}

function loginInit() {
    document.querySelector('.btn').addEventListener('click', login);
}

function register() {
    let email = document.querySelector('.email').value;
    let password = document.querySelector('.password').value;
    let fullName = document.querySelector('.fullName').value;
    let country = document.querySelector('.country').value;
    let birthdate = document.querySelector('.birthdate').value;

    let userList = JSON.parse(localStorage.getItem('users')) || [];

    let flag = false;
    for (let user of userList) {
        if (user.email === email) {
            flag = true;
            break;
        }
    }

    if (!flag) {
        let newUser = {
            'email': email,
            'password': password,
            'fullName': fullName,
            'country': country,
            'birthdate': birthdate
        };
        userList.push(newUser);
        localStorage.setItem('users', JSON.stringify(userList));
        alert('Registration successful!');
    } else {
        alert('Email is already registered. Please use a different email.');
    }
}

function login() {
    let email = document.querySelector('.email').value;
    let password = document.querySelector('.password').value;

    let userList = JSON.parse(localStorage.getItem('users')) || [];

    for (let user of userList) {
        if (user.email === email && user.password === password) {
            document.querySelector('.form').style.display = 'none';
            document.querySelector('.profile_block').style.display = 'block';
            document.querySelector('.welcomeMessage').style.display = 'block';
            toggleLoginStatus(user);
            break;
        }
        else {
            alert('Incorrect password. Please try again.');
        }
    }
    if (!userFound) {
        alert('User not found. Please check your email or register.');
    }
}

function toggleLoginStatus(user) {
    document.querySelector('.header_login_link').innerText = user ? user.fullName : 'Login';
    document.querySelector('.header_register_link').innerText = user ? 'Logout' : 'Register';

    let profileBlock = document.querySelector('.profile_block');
    let welcomeMessage = document.querySelector('.welcomeMessage');

    if (user) {
        welcomeMessage.innerHTML = `
        <p>Welcome ${user.fullName}</p>
        <p>             </p><br/>
        `;
        profileBlock.innerHTML = `<br/>
            <p>Email: ${user.email}</p>
            <p>Full Name: ${user.fullName}</p>
            <p>Country: ${user.country}</p>
            <p>Birthdate: ${user.birthdate}</p>
        `;
        alert('Login successful!');
    } else {
        profileBlock.innerHTML = ''; 
        welcomeMessage.innerHTML = ''; 
        alert('Logout successful!');
    }
}



