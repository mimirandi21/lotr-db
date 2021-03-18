const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

environment.plugins.prepend(
	"Provide",
	new webpack.ProvidePlugin({
		$: "jquery",
		jQuery: "jquery",
		moment: "moment",
	})
);
const { CleanWebpackPlugin } = require("clean-webpack-plugin");

environment.plugins.prepend("CleanWebpackPlugin", new CleanWebpackPlugin());

environment.config.set("resolve.alias", { jquery: "jquery/src/jquery" });
module.exports = environment;
