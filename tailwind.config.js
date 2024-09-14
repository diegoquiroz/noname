/** @type {import('tailwindcss').Config} */

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/frontend/**/*.{js,ts,jsx,tsx,vue,svelte}',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite-svelte/**/*.{html,js,svelte,ts}'
  ],
  darkMode: 'selector',
  theme: {
    extend: {
      colors: {
        // flowbite-svelte
        primary: {
          50: '#FFF5F2',
          100: '#FFF1EE',
          200: '#FFE4DE',
          300: '#FFD5CC',
          400: '#FFBCAD',
          500: '#FE795D',
          600: '#EF562F',
          700: '#EB4F27',
          800: '#CC4522',
          900: '#A5371B'
        }
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin'),
  ]
}