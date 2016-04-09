'use strict';
const express = require('express');
const nodemailer = require('nodemailer');
const emailSettings = require('../email-settings');
const projects = require('../models/past-work');
const parseStl = require('osatt-parse-stl');
const fs = require('fs');
const router = new express.Router();

/* GET home page. */
router.get('/', (req, res) => {
  res.render('index', { title: 'Brady Cartmell | Home' });
});

router.get('/contact', (req, res) => {
  res.render('contact', { title: 'Brady Cartmell | contact' });
});

router.get('/project-details/:projectName', (req, res) => {
  const projectData = projects[req.params.projectName];
  res.render('project-details', { 
    title: 'Brady Cartmell | Project Details',
    name: projectData.name,
    description: projectData.description,
    images: projectData.images
  });
});

router.get('/project-details', (req, res) => {
  res.render('past-work', { title: 'Brady Cartmell | Past Work' });
});


router.get('/message-sent', (req, res) => {
  res.render('message-sent', { title: 'Brady Cartmell | Message Sent' });
});


router.get('/render-stl', (req, res) => {
  res.render('render-stl', { title: 'Brady Cartmell | Message Sent' });
});


router.get('/stlModel/*', (req, res) => {
  const urlArr = req.originalUrl.split('/');
  let modelName = urlArr[urlArr.length - 1];
  const modelType = modelName.slice(modelName.lastIndexOf('.'));
  modelName = modelName.slice(0, -modelType.length);

  const modelsDir = __dirname.split('/').slice(0, -1).join('/') + '/public/CAD/';

  const modelPath = modelsDir + modelName + '/' + modelName + modelType;

  fs.readFile(modelPath, (err, data) => {
    if (err) throw err;
    console.log('file found');
    res.send(JSON.stringify(parseStl(data)));
  });
});

router.post('/contact', (req, res) => {
  const transporter = nodemailer.createTransport(emailSettings.serverSettings);
  const mailOptions = {
    from: emailSettings.messageOptions.fromAddress,
    to: emailSettings.messageOptions.toAddress,
    subject: 'contact form submitted',
    text: 'Name: ' + req.body.firstName + ' ' + req.body.lastName + '\n' +
          'company:  ' + req.body.company + '\n' +
          'email:  ' + req.body.email + '\n' +
          'message:\n ' + req.body.message,
  };

  transporter.sendMail(mailOptions, (err, info) => {
    if (err) console.log(err);
    res.redirect('/message-sent');
  });
});

module.exports = router;
