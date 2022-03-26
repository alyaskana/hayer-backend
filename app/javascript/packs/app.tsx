// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import { FC } from "react";
import { render } from "react-dom";

type AppProps = {
  name: string;
};
export const App: FC<AppProps> = ({ name }) => <div>Hello {name}!</div>;

document.addEventListener("DOMContentLoaded", () => {
  render(
    <App name="REACT LAMINAAAAT!" />,
    document.body.appendChild(document.createElement("div"))
  );
});
