const defaultState = {
    token: localStorage.token,
    user_id: localStorage.user_id,
    name: localStorage.name,
    errors: [],
    fetching: false,
    current_stock: {},
    account_balance: 0,
    portfolio: [],
    isLoggedIn: false
}

const rootReducer = (state = defaultState, action) => {

    switch (action.type){

        case "LOGIN_USER":
            return { ...state }

        case "LOGIN_USER_TOKEN":
            return { ...state }

        case "CREATE_USER_TOKEN":
            return { ...state }

        case "LOGIN_USER_STORE":
            return { ...state, token: action.loginCreds.token, user_id: action.loginCreds.id, name: action.loginCreds.name, errors: [], isLoggedIn: true }

        case "LOGIN_ERROR":
            return { ...state, errors: action.errors }

        case "LOGOUT_USER":
            return {...defaultState, isLoggedIn: false}

        default:
            return state;
    }
}

export default rootReducer