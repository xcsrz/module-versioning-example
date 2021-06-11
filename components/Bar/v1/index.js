import React from 'react';
import './Person.css'

const Bar = (props) => {
    return (
        <div className="bar">
            <h2> Hello there {props.name}, I'm Bar!</h2>
        </div>
    );
};

export default Bar;