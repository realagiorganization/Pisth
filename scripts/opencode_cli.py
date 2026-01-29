#!/usr/bin/env python3
import json
import os
import sys
import urllib.request
import urllib.error


def extract_text(response_json: dict) -> str:
    output_texts = []
    for output in response_json.get("output", []):
        for content in output.get("content", []):
            if content.get("type") == "output_text":
                output_texts.append(content.get("text", ""))
    if output_texts:
        return "\n".join(text for text in output_texts if text)
    return json.dumps(response_json, indent=2)


def main() -> int:
    api_key = os.environ.get("LLM_API_KEY")
    if not api_key:
        print("LLM_API_KEY is required.")
        return 1

    api_base = os.environ.get("LLM_API_BASE", "https://api.openai.com/v1").rstrip("/")
    model = os.environ.get("LLM_MODEL", "gpt-4o-mini")
    prompt = " ".join(sys.argv[1:]).strip() or "Summarize Pisth in one sentence."

    payload = {
        "model": model,
        "input": prompt,
    }

    request = urllib.request.Request(
        f"{api_base}/responses",
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json",
        },
        method="POST",
    )

    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            response_json = json.loads(response.read().decode("utf-8"))
    except urllib.error.HTTPError as exc:
        body = exc.read().decode("utf-8", errors="ignore")
        print(f"HTTP error {exc.code}: {body}")
        return 1
    except Exception as exc:  # noqa: BLE001
        print(f"Request failed: {exc}")
        return 1

    print(extract_text(response_json))
    return 0


if __name__ == "__main__":
    sys.exit(main())
