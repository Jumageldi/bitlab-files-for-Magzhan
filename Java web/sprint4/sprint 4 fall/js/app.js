const users = [
    { email: 'user@example.com', password: 'password123', name: 'John Doe', country: 'USA', birthday: '1990-01-01'},
    // Добавьте других пользователей по аналогии
];

function login(email, password) {
    const user = users.find(u => u.email === email && u.password === password);
    return user;
}

function register(email, password, fullName, country, birthday) {
    // Проверка на уникальность email
    if (users.some(u => u.email === email)) {
        return { error: 'Email already exists.' };
    }

    const newUser = { email, password, name: fullName, country, birthday };
    users.push(newUser);
    setCurrentUser(newUser);
    return { success: 'Registration successful.', user: newUser };
}

function setCurrentUser(user) {
    localStorage.setItem('currentUser', JSON.stringify(user));
}

function getCurrentUser() {
    const userString = localStorage.getItem('currentUser');
    return userString ? JSON.parse(userString) : null;
}

function displayUserProfile() {
    const user = getCurrentUser();
    if (user) {
        const profileInfo = document.getElementById('profileInfo');
        if (profileInfo) {
            profileInfo.innerHTML = `<p>Email: ${user.email}</p>
                                      <p>Name: ${user.name}</p>
                                      <p>Country: ${user.country}</p>
                                      <p>Birthday: ${user.birthday}</p>`;
        } else {
            console.error("Element with id 'profileInfo' not found.");
        }
    } else {
        console.error("User not found.");
    }
}

function logout() {
    localStorage.removeItem('currentUser');
    window.location.href = 'index.html';
}

// Обработчик формы входа
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('loginForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const user = login(email, password);
        if (user) {
            setCurrentUser(user);
            alert('Login successful.');
            window.location.href = 'profile.html';
        } else {
            alert('Invalid email or password. Please try again.');
        }
    });
});


// Обработчик формы регистрации
document.getElementById('registrationForm').addEventListener('submit', function (event) {
    event.preventDefault();
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const fullName = document.getElementById('fullName').value;
    const country = document.getElementById('country').value;
    const birthday = document.getElementById('birthday').value;

    const registrationResult = register(email, password, fullName, country, birthday);
    if (registrationResult.success) {
        alert(registrationResult.success);
        window.location.href = 'profile.html';
    } else {
        alert(registrationResult.error || 'Registration failed. Please try again.');
    }
});

// Инициализация отображения информации о пользователе при загрузке страницы профиля
displayUserProfile();
