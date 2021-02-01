const createStore = (reducer) => {
  let state;
  let listeners = [];

  const getState = () => state;

  const dispatch = (action) => {
    state = reducer(state, action); // 转移到下一个状态
    listeners.forEach(listener => listener()); // 状态改变时, 逐个调用监听函数
  };

  const subscribe = (listener) => {
    listeners.push(listener);
    const unsubscribe = () => {
      listeners = listeners.filter(l => l !== listener);
    }
    return unsubscribe;
  };

  dispatch({});

  return { getState, dispatch, subscribe };
};

const combineReducers = reducers => {
  return (state = {}, action) => {
    return Object.keys(reducers).reduce(
      (nextState, key) => {
        nextState[key] = reducers[key](state[key], action);
        return nextState;
      },
      {}
    );
  };
};

//----------------------------------------

const defaultState = 0; // 初始状态

// 状态转移函数
// 这是纯函数，它不改变参数的值，且输出完全由输入决定
const reducer = (state = defaultState, action) => {
  switch (action.type) {
    case 'ADD':
      return state + action.payload;
    default:
      return state;
  }
};

const store = createStore(reducer); // 创建状态机

// 作用
const actions = [
  { type: 'ADD', payload: 0 },
  { type: 'ADD', payload: 1 },
  { type: 'ADD', payload: 2 },
];

// 逐步改变状态
for (action of actions) {
    store.dispatch(action);
    console.log(store.getState()); // 0 1 3
}

// 一口气改变状态
const total = actions.reduce(reducer, 0);
console.log(total); // 3
