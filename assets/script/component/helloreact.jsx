ReactDOM.render(
    <div>
        <h1>Hello, React!</h1>
    </div>,
    document.getElementById('content')
);

var HelloReact = React.createClass({
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
    document.getElementById('view')
);