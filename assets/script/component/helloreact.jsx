/*var RibonMenu = React.createClass({
    getInitialState: function() {
        return {
            message: 'I am from default state'
        };
    },
    updateMessage: function(e) {
        this.setState({message: e.target.value});
    },
    render: function() {
        return (
            <div>
                <input type='text' onChange={this.updateMessage}/>
                <div>Hello React</div>
                <div>{this.state.message}</div>
            </div>
        );
    }
});

ReactDOM.render(
    <HelloReact />,
    document.getElementById('ribon-view')
);*/


var DefaultContentStyle = {
    textAlign : 'center',
    fontSize : '24px'
};

var DefaultContent = React.createClass({
    render: function() {
        return (
            <div style={DefaultContentStyle}>
                <h1>Webcore</h1>
            </div>
        );
    }
});

ReactDOM.render(
    <DefaultContent />,
    document.getElementById('content')
);