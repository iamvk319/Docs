@RequestMapping(value = { "/logs" }, method = RequestMethod.POST)
	public String listFiles(@Valid LogsModel logsModel, BindingResult result, ModelMap model) {
		LOGGER.info("In listFiles controller.");
		if (result.hasErrors()) {
			return "listlogs";
		}
		try {
			File folder = new File(logsModel.getLogPath());
			if(!folder.exists()) {
				result.rejectValue("logPath", "log.path.icr", "Path you've entered is incorrect");
				return "listlogs";
			}
			List<String> fileList = new ArrayList<String>();
			List<String> dirList = new ArrayList<String>();
			if(folder.isDirectory()) {
				File[] listOfFiles = folder.listFiles();
				for (int i = 0; i < listOfFiles.length; i++) {
					if (listOfFiles[i].isFile()) {
						fileList.add(listOfFiles[i].getName().trim());
					} else if(listOfFiles[i].isDirectory()) {
						dirList.add(listOfFiles[i].getName().trim());
					}
				}
				model.put("path", logsModel.getLogPath());
			} else {
				int lastIndex = logsModel.getLogPath().lastIndexOf("/");
				String fileName = logsModel.getLogPath().substring(lastIndex+1, logsModel.getLogPath().length());
				fileList.add(fileName);
				model.put("path", logsModel.getLogPath().substring(0, lastIndex));
			}
			model.put("fileList", fileList);
			model.put("dirList", dirList);
			
		} catch (UnsupportedOperationException e) {
			LOGGER.error("Error in Test controller: " + e.getMessage());
			model.put("error", "There is an error exists " + e.getMessage());
		}
		return "listlogs";
	}