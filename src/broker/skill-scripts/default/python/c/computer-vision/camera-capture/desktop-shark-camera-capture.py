import cv2

# Open a camera capture object
cap = cv2.VideoCapture(0)  # Use camera index 0 for the default camera

# Check if camera opened successfully
if not cap.isOpened():
    print("Failed to open camera")
    exit(1)

while True:
    # Capture frame-by-frame
    ret, frame = cap.read()

    # Check if frame was captured successfully
    if not ret:
        print("Failed to capture frame")
        break

    # Display the frame
    cv2.imshow("Camera", frame)

    # Exit the loop if 'q' key is pressed
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the camera capture object
cap.release()

# Close all OpenCV windows
cv2.destroyAllWindows()

