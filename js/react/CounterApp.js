import React from 'react';
import ReactDOM from 'react-dom';
import { createStore } from './store';

const reducer = (state = 0, action) => {
  switch (action.type) {
    case 'INCREMENT': return state + 1;
    case 'DECREMENT': return state - 1;
    default: return state;
  }
}

const store = createStore(reducer);

const Counter = ({value}) => (
  <>
    <h1>{value}</h1>
    <button onClick={() => {store.dispatch({type: 'INCREMENT'})}}>+</button>
    <button onClick={() => {store.dispatch({type: 'DECREMENT'})}}>-</button>
  </>
);

const render = () => {
  ReactDOM.render(
    <Counter value={store.getState()}/>,
    document.getElementById('root')
  );
};

render();
store.subscribe(render);
