import { Detail, render } from "@raycast/api";
import { getCrates } from "./api";

render(<Main />);
test();

function Main(): JSX.Element {
  return <Detail markdown="# Hello World!" />;
}

async function test(): Promise<void> {
  const crates = await getCrates("time");
  console.log(crates);
}
