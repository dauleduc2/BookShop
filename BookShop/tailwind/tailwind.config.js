const theme = require("tailwindcss/defaultTheme");

module.exports = {
        purge: ["../**/*.jsp"],
        darkMode: false, // or 'media' or 'class'
        theme: {
                extend: {},
                colors: {
                        ...theme.colors,
                },
        },
        variants: {
                extend: {},
        },
        plugins: [],
};
