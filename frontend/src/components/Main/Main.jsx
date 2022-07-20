import React from 'react'
import './Main.scss';
// import { Routes, Route } from "react-router-dom";
import "../../styles/styles.scss";
import Contact from '../Contact/Contact';
import FrontPage from '../FrontPage/FrontPage';

function Main() {
    return (
        <div className='main'>
            <Contact />
        </div>
    )
}

export default Main