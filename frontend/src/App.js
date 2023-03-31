import { Login } from "./Components/Login";
import { Register } from "./Components/Register";
import { Route, Routes } from "react-router";
import { Home } from "./Components/Home";
import  Lessons  from "./Components/Lessons";
import { Cart }   from "./Components/Cart";

function App() {
  return (
      <Routes>
        <Route index path="/" element={<Home />} />
        <Route index path="/home" element={<Home />} />
        <Route index path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/lessons" element={<Lessons />} />
        <Route path="/cart" element={<Cart />} />
      </Routes>
  );
}

export default App;
