public String httpPostCall(String url, String requestBody) throws IOException {
		StringBuffer response = null;
		HttpURLConnection httpConnection = null;
		try 
		{
			COM_GEN_Parameter com_GEN_Parameter = COM_GEN_Parameter.getParamInstance();
			String uidaiTimeout=com_GEN_Parameter.getParamMap().get("HIFF_TIMEOUT");
			String uidaiConnTimeout = uidaiTimeout.split("~")[0];
			String uidaiReadTimeout = uidaiTimeout.split("~")[1];
			URL urlConn = new URL(url);
			httpConnection = (HttpURLConnection) urlConn.openConnection();
			httpConnection.setRequestProperty("Content-Type", "text/xml");
			httpConnection.setRequestMethod("POST");
			httpConnection.setDoOutput(true);
			httpConnection.setDoInput(true);
			httpConnection.setConnectTimeout(Integer.parseInt(uidaiConnTimeout));
			httpConnection.setReadTimeout(Integer.parseInt(uidaiReadTimeout));

			OutputStreamWriter stream = new OutputStreamWriter(httpConnection.getOutputStream());
			stream.write(requestBody);
			stream.flush();
			stream.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(httpConnection.getInputStream()));
			String inputLine;
			response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

		} finally {
			if (httpConnection != null) {
				httpConnection.disconnect();
			}
		}
		return response.toString();
	}