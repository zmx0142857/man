----ClassComponent.js-----------------------------------
import React from 'react';

class ClassComponent extends React.Component {
    state = { number: 0}

    componentDidMount() {
        this.setState({ number: 10 });
    }

    render() {
        const { number } = this.state;
        return (
            <div>
                <p>Class Component!</p>
                <p>State: {number}.</p>
            </div>
        );
    }
}
export default ClassComponent;
--------------------------------------------------------

----FunctionalComponent.js------------------------------
import React from 'react';

const FunctionalComponent = ({ number = 10}) => {
    return (
        <div>
            <p>Functional Component!</p>
            <p>State: {number}.</p>
        </div>
    );
}
export default FunctionalComponent;
--------------------------------------------------------
