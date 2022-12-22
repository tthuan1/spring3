import React from 'react';


class Footer extends React.Component {
    render() {
        return (
            <div>
                <div className="card text-center">
                    <div className="card-header">
                        Featured
                    </div>
                    <div className="card-body">
                        <h5 className="card-title">Trần Thuận</h5>
                        <p className="card-text">Hello.</p>
                        <a href="#" className="btn btn-primary">Go somewhere</a>
                    </div>
                    <div className="card-footer text-muted">
                        2 days ago
                    </div>
                </div>
            </div>
        );
    }
}
export default Footer;
