import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Layout from "./pages/Layout";
import Home from "./pages/Home";
import Admin from "./pages/Admin";
import User from "./pages/User";
import Navbar from "./components/Navbar";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import Adminpage from "./pages/Adminpage";
import Registration from "./pages/Registration";
import Payment from "./pages/Payment";
import PaymentConfirmation from "./pages/PaymentConfirmation";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="User" element={<User />} />
          <Route path="Admin" element={<Admin />} />
          <Route path="AdminPage" element={<Adminpage />} />
          <Route path="Registration" element={<Registration />} />
          <Route path="Payment" element={<Payment />} />
          <Route path="PaymentConfirmation" element={<PaymentConfirmation />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<App />);
