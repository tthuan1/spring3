import React from "react";


class Content extends React.Component {
    constructor() {
        super();
        this.state = {
            data:
                [
                    {
                        id: 1,
                        name: "Sofa",
                        status: "new",
                        price: "6000$"
                    },
                    {
                        id: 2,
                        name: "plastic chair",
                        status: "90%",
                        price: "900$"
                    },
                    {
                        id: 3,
                        name: "office chair",
                        status: "new",
                        price: "1000$"
                    }
                ]
        }
    }

    render() {
        return (
            <div>
                <table className="table">
                    <thead>
                    <tr>
                        <th scope="col">stt</th>
                        <th scope="col">Name</th>
                        <th scope="col">Status</th>
                        <th scope="col">Price</th>
                    </tr>
                    </thead>
                    <tbody>

                    {this.state.data.map((data, i) =>
                        <tr>
                            <th scope="row">{i + 1}</th>
                            <td>{data.name}</td>
                            <td>{data.status}</td>
                            <td>{data.price}</td>
                        </tr>
                    )}
                    </tbody>
                </table>
            </div>
        );
    }
}

export default Content;
