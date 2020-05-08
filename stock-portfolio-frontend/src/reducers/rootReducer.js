const defaultState = {
    token: '',
    user_id: '',
    name: '',
    errors: [],
    fetching: false,
    current_stock: {},
    account_balance: 0,
    portfolio: [],
}

const rootReducer = (state = defaultState, action) => {
    switch (action.type){

        case "LOGIN_USER":
            return { ...state }

        default:
            return state;
    }
}

export default rootReducer