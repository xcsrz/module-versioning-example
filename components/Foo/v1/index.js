import React from 'react';
import './Person.css'

const Foo = (props) => {
    return (
        <div className="foo">
            <h2> Hello there {props.name}, I'm Foo!</h2>
        </div>
    );
};

export default Foo;