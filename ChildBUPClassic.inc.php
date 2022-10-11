<?php

/**
 * @defgroup plugins_themes_default_child ChildBUP-Classic
 */

/**
 * @file plugins/themes/ChildBUP-Classic/index.php
 *
 * Copyright (c) Lara Marziali
 * Distributed under the GNU GPL v3. For full terms see the file LICENSE.
 *
 * @class ChildBUPClassic
 * @ingroup plugins_themes_childBUP-Classic
 *
 * @brief Default theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');

class ChildBUPClassic extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {
		$this->setParent('classicthemeplugin');
		$this->addStyle('custom-stylesheet', 'less/custom.less');
		$this->addScript('custom', 'js/custom.js');
		
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __("plugins.themes.childbup-classic.name");
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __("plugins.themes.childbup-classic.description");
	}
}

?>