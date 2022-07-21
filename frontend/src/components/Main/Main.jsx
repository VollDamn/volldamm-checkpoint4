import React from 'react'
import './Main.scss';
// import { Routes, Route } from "react-router-dom";
import "../../styles/styles.scss";
import Contact from '../Contact/Contact';
import FrontPage from '../FrontPage/FrontPage';
import Layout from './Layout';

function Main() {
    return (
        <div className='main'>
            <Layout />
        </div>
    )
}

export default Main