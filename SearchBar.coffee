React = require 'react-native'

RNSearchBar = React.requireNativeComponent 'RNSearchBar', null

PropTypes = require 'ReactPropTypes'

NativeModules = require 'NativeModules'


SearchBar = React.createClass

  propTypes:
    placeholder: PropTypes.string
    showsCancelButton: PropTypes.bool
    onChange: PropTypes.func
    onChangeText: PropTypes.func
    onFocus: PropTypes.func
    onSearchButtonPress: PropTypes.func
    onCancelButtonPress: PropTypes.func

  _onChange: (e) ->
    @props.onChange? e
    @props.onChangeText? e.nativeEvent.text

  _onPress: (e) ->
    button = e.nativeEvent.button

    if button == 'search'
      @props.onSearchButtonPress? e.nativeEvent.searchText
    else if button == 'cancel'
      @props.onCancelButtonPress?()

  render: ->
    `<RNSearchBar
      style={{height: NativeModules.RNSearchBarManager.ComponentHeight}}
      onChange={this._onChange}
      onPress={this._onPress}
      {...this.props}
    />`

module.exports = SearchBar