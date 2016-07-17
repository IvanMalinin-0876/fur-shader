import { $window } from './dom';

export default {
	isFacebookApp() {
		if (window.navigator.userAgent.toLowerCase().indexOf('fban/fbios;fbav') !== -1) {
			return true;
		} else {
			return false;
		}
	},
	getFacebookAppHeight() {
		return $window.height() - 100;
	}
};
