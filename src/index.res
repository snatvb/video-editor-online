%%raw(`import 'rsuite/dist/rsuite.min.css';`)
%%raw(`import './styles/global.scss';`)

ReactDOM.render(
  <React.StrictMode>
    <RSuite.CustomProvider theme={#dark}> <App /> </RSuite.CustomProvider>
  </React.StrictMode>,
  ReactDOM.querySelector("#root")->Belt.Option.getExn,
)
