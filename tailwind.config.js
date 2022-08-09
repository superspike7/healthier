/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      keyframes: {
        flash: {
          "0%": { opacity: 0 },
          "5%": { opacity: 1 },
          "60%": { opacity: 1 },
          "100%": { opacity: 0 },
        },
      },
      animation: {
        flash: "flash 4s both",
      },
    },
  },
  plugins: [],
};
