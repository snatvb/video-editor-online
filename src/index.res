%%raw(`import 'antd/dist/antd.dark.css';`)
%%raw(`import './styles/global.css';`)

ReactDOM.render(
  <React.StrictMode> <App /> </React.StrictMode>,
  ReactDOM.querySelector("#root")->Belt.Option.getExn,
)
