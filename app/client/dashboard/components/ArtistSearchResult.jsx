import React from 'react';
import axios from 'axios';
import ArtistControls from './ArtistControls';

class ArtistSearchResult extends React.Component {
  render() {
    const result = this.props.result;

    return (
      <tr>
        <td>{result.artist.name}</td>
        <td>{result.score}</td>
        <td>
          <ArtistControls
            artist={result.artist}
            onAdd={() => this.props.onAdd(result.artist)}
            onRemove={() => this.props.onRemove(result.artist)}
            onPause={() => this.props.onPause(result.artist)}
            onUnpause={() => this.props.onUnpause(result.artist)}
          />
        </td>
      </tr>
    );
  }
}

export default ArtistSearchResult;
