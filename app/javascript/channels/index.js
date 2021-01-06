// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);

const express = require("express");
const canvas = require("canvas");
const PORT = process.env.PORT || 5000;

express()
	.get("/", (req, res) =>
		res.send({ version: canvas.version, cairoVersion: canvas.cairoVersion })
	)
	.listen(PORT, () => console.log(`Listening on ${PORT}`));
