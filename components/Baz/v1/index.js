import React from 'react';
import './Person.css'

const Baz = (props) => {
    return (
        <div className="baz">
            <h2> Hello there {props.name}, I'm Baz!</h2>
        </div>
    );
};

export default Baz;